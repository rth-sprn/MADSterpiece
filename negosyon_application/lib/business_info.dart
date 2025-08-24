import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'business_operations.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Business Information',
      theme: ThemeData(
        primaryColor: Color(0xFFB11116),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.poppins(
            color: Color(0xFFB11116),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          iconTheme: IconThemeData(color: Color(0xFFB11116)),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.poppins(color: Color(0xFF9CA3AF), fontSize: 16),
          errorStyle: GoogleFonts.poppins(color: Colors.red, fontSize: 12),
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
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) => Color(0xFFB11116)),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFFB11116),
          selectionColor: Color(0xFFB11116).withOpacity(0.3),
          selectionHandleColor: Color(0xFFB11116),
        ),
      ),
      home: BusinessInformationPage(),
    );
  }
}

class BusinessInformationPage extends StatefulWidget {
  const BusinessInformationPage({super.key});

  @override
  _BusinessInformationPageState createState() => _BusinessInformationPageState();
}

class _BusinessInformationPageState extends State<BusinessInformationPage> {
  final _formKey = GlobalKey<FormState>();
  final _businessNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _businessTypeOthersController = TextEditingController();
  final _borrowerTypeOthersController = TextEditingController();

  String? selectedBusinessType;
  String? selectedBorrowerType;
  String? selectedYearsOperation;
  String? selectedMonthlyIncome;
  bool isFilipinoCitizen = true;
  bool hasLivedInPhilippines = true;

  final List<String> businessTypes = [
    'Sari-Sari Store',
    'Online Seller',
    'Food Stall',
    'Service Provider',
    'Others'
  ];

  final List<String> borrowerTypes = [
    'Sole Proprietor',
    'Partnership',
    'Corporation',
    'Cooperative',
    'Others'
  ];

  final List<String> yearsOperations = [
    '<1 Year',
    '1-3 Years',
    '3-5 Years',
    '5-10 Years',
    '>10 Years'
  ];

  final List<String> monthlyIncomes = [
    '< ₱10k',
    '₱10k-₱30k',
    '₱30k-₱50k',
    '₱50k - ₱100k',
    '+ ₱100k'
  ];

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
                'Business Information',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Step 1 of 3',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color(0xFFB11116),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30),

              // Fields
              _buildLabel('Business Name / Owner Name'),
              _buildTextField(controller: _businessNameController, hintText: 'e.g., ABC Store', isRequired: true),
              SizedBox(height: 20),

              _buildLabel('Business Type'),
              _buildDropdown(
                initialValue: selectedBusinessType,
                hint: 'Business Type',
                items: businessTypes,
                isRequired: true,
                onChanged: (value) => setState(() => selectedBusinessType = value),
              ),
              if (selectedBusinessType == 'Others') ...[
                SizedBox(height: 10),
                _buildTextField(controller: _businessTypeOthersController, hintText: 'Others', isRequired: true),
              ],
              SizedBox(height: 20),

              _buildLabel('Business Borrower Type'),
              _buildDropdown(
                initialValue: selectedBorrowerType,
                hint: 'Business Borrower Type',
                items: borrowerTypes,
                isRequired: true,
                onChanged: (value) => setState(() => selectedBorrowerType = value),
              ),
              if (selectedBorrowerType == 'Others') ...[
                SizedBox(height: 10),
                _buildTextField(controller: _borrowerTypeOthersController, hintText: 'Others', isRequired: true),
              ],
              SizedBox(height: 20),

              _buildLabel('Years in Operation'),
              _buildDropdown(
                initialValue: selectedYearsOperation,
                hint: 'Years in Operation',
                items: yearsOperations,
                isRequired: true,
                onChanged: (value) => setState(() => selectedYearsOperation = value),
              ),
              SizedBox(height: 20),

              _buildLabel('Location'),
              _buildTextField(controller: _locationController, hintText: 'Barangay, City, Province', isRequired: true),
              SizedBox(height: 20),

              _buildLabel('Monthly Income'),
              _buildDropdown(
                initialValue: selectedMonthlyIncome,
                hint: 'Monthly Income',
                items: monthlyIncomes,
                isRequired: true,
                onChanged: (value) => setState(() => selectedMonthlyIncome = value),
              ),
              SizedBox(height: 30),

              _buildLabel('Filipino Citizen?'),
              _buildRadioGroup(value: isFilipinoCitizen, onChanged: (val) => setState(() => isFilipinoCitizen = val ?? true)),
              SizedBox(height: 20),

              _buildLabel('Have you lived in the Philippines for at least 1 year?'),
              _buildRadioGroup(value: hasLivedInPhilippines, onChanged: (val) => setState(() => hasLivedInPhilippines = val!)),
              SizedBox(height: 40),

              // Next Button (scrollable)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigate to BusinessOperationsPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BusinessOperationsPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please fill in all required fields'),
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
                  child: Text(
                    'Next',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
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

  Widget _buildTextField({
  required TextEditingController controller,
  required String hintText,
  bool isRequired = false,
}) {
  return TextFormField(
    controller: controller,
    validator: isRequired
        ? (value) => value == null || value.trim().isEmpty ? 'This field is required' : null
        : null,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(
        color: Color(0xFF9CA3AF),
        fontSize: 16,
      ),
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
    style: GoogleFonts.poppins(
      fontSize: 16,
      color: Colors.black,
    ),
  );
}

Widget _buildDropdown({
  required String? initialValue,
  required String hint,
  required List<String> items,
  required Function(String?) onChanged,
  bool isRequired = false,
}) {
  return DropdownButtonFormField<String>(
    value: initialValue,
    validator: isRequired
        ? (value) => value == null || value.isEmpty ? 'This field is required' : null
        : null,
    decoration: InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
    items: items
        .map((item) => DropdownMenuItem(
              value: item,
              child: Text(item, style: GoogleFonts.poppins(fontSize: 16, color: Colors.black)),
            ))
        .toList(),
    onChanged: onChanged,
  );
}

  Widget _buildRadioGroup({
    required bool value,
    required ValueChanged<bool?> onChanged,
  }) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min, // keeps it tight
          children: [
            Radio<bool>(
              value: true,
              groupValue: value,
              onChanged: onChanged,
              activeColor: Color(0xFFB11116),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // reduce tap padding
              visualDensity: VisualDensity(horizontal: -4, vertical: -4), // shrink space
            ),
            SizedBox(width: 6), // tighter space between radio & label
            Text(
              'Yes',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<bool>(
              value: false,
              groupValue: value,
              onChanged: onChanged,
              activeColor: Color(0xFFB11116),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
            ),
            SizedBox(width: 6),
            Text(
              'No',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
