import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'esg_readiness.dart';

class BusinessOperationsPage extends StatefulWidget {
  @override
  _BusinessOperationsPageState createState() => _BusinessOperationsPageState();
}

class _BusinessOperationsPageState extends State<BusinessOperationsPage> {
  final _formKey = GlobalKey<FormState>();

  // Checkbox selections
  List<String> selectedPaymentChannels = [];
  List<String> selectedInventorySystems = [];
  List<String> selectedExistingLoans = [];

  final List<String> paymentChannels = ['Cash', 'G-Cash', 'BPI', 'Maya', 'Others'];
  final List<String> inventorySystems = ['Manual / Notebook', 'Excel', 'App-based', 'Others'];
  final List<String> existingLoans = ['None', 'Informal Loan', 'Microfinance', 'Bank Loan', 'Others'];

  // Controllers for "Others"
  final _othersPaymentController = TextEditingController();
  final _othersInventoryController = TextEditingController();
  final _othersLoansController = TextEditingController();

  // Radio buttons
  bool? hasDTIPermit;
  bool? hasSECRegistration;
  bool? keepsBankStatements;
  bool? hasAnnualFinancialStatements;
  bool? hasCollateral;

  @override
  void dispose() {
    _othersPaymentController.dispose();
    _othersInventoryController.dispose();
    _othersLoansController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFB11116), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Back',
          style: GoogleFonts.poppins(
            color: Color(0xFFB11116),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
        titleSpacing: -10,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Business Operations',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Step 2 of 3',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color(0xFFB11116),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30),

              // Fields
              _buildLabel('Payment Channels Used'),
              _buildCheckboxGroup(
                paymentChannels,
                selectedPaymentChannels,
                (item, isSelected) {
                  setState(() {
                    isSelected
                        ? selectedPaymentChannels.add(item)
                        : selectedPaymentChannels.remove(item);
                  });
                },
                othersController: _othersPaymentController,
              ),
              SizedBox(height: 20),

              _buildLabel('Inventory System'),
              _buildCheckboxGroup(
                inventorySystems,
                selectedInventorySystems,
                (item, isSelected) {
                  setState(() {
                    isSelected
                        ? selectedInventorySystems.add(item)
                        : selectedInventorySystems.remove(item);
                  });
                },
                othersController: _othersInventoryController,
              ),
              SizedBox(height: 20),

              _buildLabel('Existing Loans'),
              _buildCheckboxGroup(
                existingLoans,
                selectedExistingLoans,
                (item, isSelected) {
                  setState(() {
                    isSelected
                        ? selectedExistingLoans.add(item)
                        : selectedExistingLoans.remove(item);
                  });
                },
                othersController: _othersLoansController,
              ),
              SizedBox(height: 20),

              _buildLabel('Do you have a DTI/Barangay Business Permit?'),
              _buildRadioGroup(hasDTIPermit, (val) => setState(() => hasDTIPermit = val)),
              SizedBox(height: 20),

              _buildLabel('If Partnership/Corp, Do you have SEC Registration?'),
              _buildRadioGroup(hasSECRegistration, (val) => setState(() => hasSECRegistration = val)),
              SizedBox(height: 20),

              _buildLabel('Do you keep bank statements?'),
              _buildRadioGroup(keepsBankStatements, (val) => setState(() => keepsBankStatements = val)),
              SizedBox(height: 20),

              _buildLabel('Do you have annual financial statements/ITR?'),
              _buildRadioGroup(hasAnnualFinancialStatements, (val) => setState(() => hasAnnualFinancialStatements = val)),
              SizedBox(height: 20),

              _buildLabel('Do you have collateral (property, vehicle, etc.)?'),
              _buildRadioGroup(hasCollateral, (val) => setState(() => hasCollateral = val)),
              SizedBox(height: 40),

              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_validateForm()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ESGReadinessPage()), // Step 3
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill in all required fields', style: GoogleFonts.poppins()),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB11116),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                  child: Text('Next', style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: '* ', style: GoogleFonts.poppins(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500)),
            TextSpan(text: text, style: GoogleFonts.poppins(color: Color(0xFF1A1A1A), fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxGroup(
    List<String> items,
    List<String> selectedItems,
    Function(String, bool) onChanged, {
    TextEditingController? othersController,
  }) {
    return Column(
      children: items.map((item) {
        bool isSelected = selectedItems.contains(item);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      border: Border.all(color: isSelected ? Color(0xFFB11116) : Color(0xFFE5E7EB), width: 2),
                      borderRadius: BorderRadius.circular(4),
                      color: isSelected ? Color(0xFFB11116) : Colors.transparent,
                    ),
                    child: isSelected ? Icon(Icons.check, size: 14, color: Colors.white) : null,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => onChanged(item, !isSelected),
                      child: Text(item, style: GoogleFonts.poppins(fontSize: 16, color: Color(0xFF1A1A1A))),
                    ),
                  ),
                ],
              ),
            ),
            if (item == 'Others' && selectedItems.contains('Others'))
              Padding(
                padding: EdgeInsets.only(left: 32, top: 8, bottom: 12),
                child: TextFormField(
                  controller: othersController,
                  style: GoogleFonts.poppins(fontSize: 16, color: Color(0xFF1A1A1A)),
                  decoration: InputDecoration(
                    hintText: 'Please specify',
                    hintStyle: GoogleFonts.poppins(color: Color(0xFF9CA3AF), fontSize: 16),
                    contentPadding: EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFFB11116)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    errorStyle: GoogleFonts.poppins(color: Colors.red, fontSize: 12),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
              ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildRadioGroup(bool? value, ValueChanged<bool?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: value,
              onChanged: onChanged,
              activeColor: Color(0xFFB11116),
              visualDensity: VisualDensity(horizontal: -4), 
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, 
            ),
            Text(
              'Yes',
              style: GoogleFonts.poppins(fontSize: 16, color: Color(0xFF1A1A1A)),
            ),
          ],
        ),
        Row(
          children: [
            Radio<bool>(
              value: false,
              groupValue: value,
              onChanged: onChanged,
              activeColor: Color(0xFFB11116),
              visualDensity: VisualDensity(horizontal: -4),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Text(
              'No',
              style: GoogleFonts.poppins(fontSize: 16, color: Color(0xFF1A1A1A)),
            ),
          ],
        ),
      ],
    );
  }

  bool _validateForm() {
    if (selectedPaymentChannels.isEmpty ||
        selectedInventorySystems.isEmpty ||
        selectedExistingLoans.isEmpty ||
        hasDTIPermit == null ||
        keepsBankStatements == null ||
        hasAnnualFinancialStatements == null ||
        hasCollateral == null) {
      return false;
    }

    if (selectedPaymentChannels.contains('Others') && _othersPaymentController.text.isEmpty) return false;
    if (selectedInventorySystems.contains('Others') && _othersInventoryController.text.isEmpty) return false;
    if (selectedExistingLoans.contains('Others') && _othersLoansController.text.isEmpty) return false;

    return true;
  }
}
