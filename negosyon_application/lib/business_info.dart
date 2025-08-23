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
      title: 'Business Information',
      theme: ThemeData(
        primaryColor: Color(0xFFB11116),
        fontFamily: 'SF Pro Display',
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: BusinessInformationPage(),
    );
  }
}

class BusinessInformationPage extends StatefulWidget {
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
                    'Business Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Step 1 of 3',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  
                  SizedBox(height: 30),
                  
                  // Business Name / Owner Name
                  _buildLabel('Business Name / Owner Name'),
                  _buildTextField(
                    controller: _businessNameController,
                    hintText: 'e.g., ABC Store',
                    isRequired: true,
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Business Type
                  _buildLabel('Business Type'),
                  _buildDropdown(
                    value: selectedBusinessType,
                    hint: 'Business Type',
                    items: businessTypes,
                    isRequired: true,
                    onChanged: (value) {
                      setState(() {
                        selectedBusinessType = value;
                      });
                    },
                  ),
                  
                  if (selectedBusinessType == 'Others') ...[
                    SizedBox(height: 10),
                    _buildTextField(
                      controller: _businessTypeOthersController,
                      hintText: 'Others',
                      isRequired: true,
                    ),
                  ],
                  
                  SizedBox(height: 20),
                  
                  // Business Borrower Type
                  _buildLabel('Business Borrower Type'),
                  _buildDropdown(
                    value: selectedBorrowerType,
                    hint: 'Business Borrower Type',
                    items: borrowerTypes,
                    isRequired: true,
                    onChanged: (value) {
                      setState(() {
                        selectedBorrowerType = value;
                      });
                    },
                  ),
                  
                  if (selectedBorrowerType == 'Others') ...[
                    SizedBox(height: 10),
                    _buildTextField(
                      controller: _borrowerTypeOthersController,
                      hintText: 'Others',
                      isRequired: true,
                    ),
                  ],
                  
                  SizedBox(height: 20),
                  
                  // Years in Operation
                  _buildLabel('Years in Operation'),
                  _buildDropdown(
                    value: selectedYearsOperation,
                    hint: 'Years in Operation',
                    items: yearsOperations,
                    isRequired: true,
                    onChanged: (value) {
                      setState(() {
                        selectedYearsOperation = value;
                      });
                    },
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Location
                  _buildLabel('Location'),
                  _buildTextField(
                    controller: _locationController,
                    hintText: 'Barangay, City, Province',
                    isRequired: true,
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Monthly Income
                  _buildLabel('Monthly Income'),
                  _buildDropdown(
                    value: selectedMonthlyIncome,
                    hint: 'Monthly Income',
                    items: monthlyIncomes,
                    isRequired: true,
                    onChanged: (value) {
                      setState(() {
                        selectedMonthlyIncome = value;
                      });
                    },
                  ),
                  
                  SizedBox(height: 30),
                  
                  // Filipino Citizen
                  _buildLabel('Filipino Citizen?'),
                  _buildRadioGroup(
                    value: isFilipinoCitizen,
                    onChanged: (value) {
                      setState(() {
                        isFilipinoCitizen = value!;
                      });
                    },
                  ),
                  
                  SizedBox(height: 20),
                  
                  // Have you lived in the Philippines
                  _buildLabel('Have you lived in the Philippines for at least 1 year?'),
                  _buildRadioGroup(
                    value: hasLivedInPhilippines,
                    onChanged: (value) {
                      setState(() {
                        hasLivedInPhilippines = value!;
                      });
                    },
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
                if (_formKey.currentState!.validate()) {
                  // All required fields are filled
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Proceeding to next step...')),
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
      padding: EdgeInsets.only(bottom: 8),
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
  
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool isRequired = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: controller,
        validator: isRequired ? (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
          return null;
        } : null,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
        ),
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
  
  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
    bool isRequired = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        validator: isRequired ? (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        } : null,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Color(0xFF9CA3AF),
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
          errorStyle: TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Color(0xFF9CA3AF),
        ),
      ),
    );
  }
  
  Widget _buildRadioGroup({
    required bool value,
    required Function(bool?) onChanged,
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
}