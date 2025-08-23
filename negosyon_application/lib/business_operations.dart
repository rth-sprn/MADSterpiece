import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Business Operations',
      theme: ThemeData(
        primaryColor: Color(0xFFB11116),
        fontFamily: 'SF Pro Display',
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: BusinessOperationsPage(),
    );
  }
}

class BusinessOperationsPage extends StatefulWidget {
  @override
  _BusinessOperationsPageState createState() => _BusinessOperationsPageState();
}

class _BusinessOperationsPageState extends State<BusinessOperationsPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Payment Channels Used (multiple selection)
  List<String> selectedPaymentChannels = [];
  final List<String> paymentChannels = [
    'Cash',
    'G-Cash',
    'BPI',
    'Maya',
    'Others'
  ];
  
  // Inventory System (multiple selection)
  List<String> selectedInventorySystems = [];
  final List<String> inventorySystems = [
    'Manual / Notebook',
    'Excel',
    'App-based',
    'Others'
  ];
  
  // Existing Loans (multiple selection)
  List<String> selectedExistingLoans = [];
  final List<String> existingLoans = [
    'None',
    'Informal Loan',
    'Microfinance',
    'Bank Loan',
    'Others'
  ];
  
  // Radio button values
  bool? hasDTIPermit;
  bool? hasSECRegistration;
  bool? keepsBankStatements;
  bool? hasAnnualFinancialStatements;
  bool? hasCollateral;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.red, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Back',
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
        titleSpacing: -10,
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Step
                    Text(
                      'Business Operations',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Step 2 of 3',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    
                    SizedBox(height: 30),
                    
                    // Payment Channels Used
                    _buildLabel('Payment Channels Used'),
                    _buildCheckboxGroup(
                      items: paymentChannels,
                      selectedItems: selectedPaymentChannels,
                      onChanged: (item, isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedPaymentChannels.add(item);
                          } else {
                            selectedPaymentChannels.remove(item);
                          }
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 30),
                    
                    // Inventory System
                    _buildLabel('Inventory System'),
                    _buildCheckboxGroup(
                      items: inventorySystems,
                      selectedItems: selectedInventorySystems,
                      onChanged: (item, isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedInventorySystems.add(item);
                          } else {
                            selectedInventorySystems.remove(item);
                          }
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 30),
                    
                    // Existing Loans
                    _buildLabel('Existing Loans'),
                    _buildCheckboxGroup(
                      items: existingLoans,
                      selectedItems: selectedExistingLoans,
                      onChanged: (item, isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedExistingLoans.add(item);
                          } else {
                            selectedExistingLoans.remove(item);
                          }
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 30),
                    
                    // DTI/Barangay Business Permit
                    _buildLabel('Do you have a DTI/Barangay Business Permit?'),
                    _buildRadioGroup(
                      value: hasDTIPermit,
                      onChanged: (value) {
                        setState(() {
                          hasDTIPermit = value;
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 20),
                    
                    // SEC Registration
                    Text(
                      'If Partnership/Corp, Do you have SEC Registration?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    _buildRadioGroup(
                      value: hasSECRegistration,
                      onChanged: (value) {
                        setState(() {
                          hasSECRegistration = value;
                        });
                      },
                      isRequired: false,
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Bank Statements
                    _buildLabel('Do you keep bank statements?'),
                    _buildRadioGroup(
                      value: keepsBankStatements,
                      onChanged: (value) {
                        setState(() {
                          keepsBankStatements = value;
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Annual Financial Statements
                    _buildLabel('Do you have annual financial statements/ITR?'),
                    _buildRadioGroup(
                      value: hasAnnualFinancialStatements,
                      onChanged: (value) {
                        setState(() {
                          hasAnnualFinancialStatements = value;
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Collateral
                    _buildLabel('Do you have collateral (property, vehicle, etc.)?'),
                    _buildRadioGroup(
                      value: hasCollateral,
                      onChanged: (value) {
                        setState(() {
                          hasCollateral = value;
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          
          // Next Button
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () {
                // Validate form before proceeding
                if (_validateForm()) {
                  // All required fields are filled
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Proceeding to step 3...')),
                  );
                } else {
                  // Show validation errors
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill in all required fields'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFDC2626),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '* ',
              style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCheckboxGroup({
    required List<String> items,
    required List<String> selectedItems,
    required Function(String, bool) onChanged,
    bool isRequired = false,
  }) {
    return Column(
      children: items.map((item) {
        bool isSelected = selectedItems.contains(item);
        return Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? Colors.red : Color(0xFFE5E7EB),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color: isSelected ? Colors.red : Colors.transparent,
                ),
                child: isSelected
                    ? Icon(
                        Icons.check,
                        size: 14,
                        color: Colors.white,
                      )
                    : null,
              ),
              SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () => onChanged(item, !isSelected),
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
  
  Widget _buildRadioGroup({
    required bool? value,
    required Function(bool?) onChanged,
    bool isRequired = false,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: value,
              onChanged: onChanged,
              activeColor: Colors.red,
            ),
            Text(
              'Yes',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Radio<bool>(
              value: false,
              groupValue: value,
              onChanged: onChanged,
              activeColor: Colors.red,
            ),
            Text(
              'No',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  bool _validateForm() {
    bool isValid = true;
    
    // Validate required checkbox groups
    if (selectedPaymentChannels.isEmpty) {
      isValid = false;
    }
    if (selectedInventorySystems.isEmpty) {
      isValid = false;
    }
    if (selectedExistingLoans.isEmpty) {
      isValid = false;
    }
    
    // Validate required radio buttons
    if (hasDTIPermit == null) {
      isValid = false;
    }
    if (keepsBankStatements == null) {
      isValid = false;
    }
    if (hasAnnualFinancialStatements == null) {
      isValid = false;
    }
    if (hasCollateral == null) {
      isValid = false;
    }
    
    // SEC Registration is not required (no red asterisk)
    
    return isValid;
  }
}