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
      title: 'ESG Readiness',
      theme: ThemeData(
        primaryColor: Color(0xFFB11116),
        fontFamily: 'SF Pro Display',
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: ESGReadinessPage(),
    );
  }
}

class ESGReadinessPage extends StatefulWidget {
  @override
  _ESGReadinessPageState createState() => _ESGReadinessPageState();
}

class _ESGReadinessPageState extends State<ESGReadinessPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Environmental (E)
  bool? usesEcoFriendlyPackaging;
  List<String> selectedWasteManagement = [];
  final List<String> wasteManagementOptions = [
    'Recycling',
    'Waste Segregation',
    'Eco-Friendly Products',
    'Proper Disposal',
    'Energy Conservation',
    'Water Conservation',
    'Sustainable Sourcing and Supply Chain'
  ];
  
  // Social (S)
  String? numberOfEmployees;
  final List<String> employeeOptions = [
    '>10 Employees',
    '10-99 Employees',
    '100-199 Employees',
    '>200 Employees',
    'None'
  ];
  bool? employeesHaveContracts;
  
  // Governance (G)
  bool? isBusinessRegistered;
  bool? keepsFinancialRecords;
  bool? separatesPersonalBusinessMoney;
  
  // Privacy Agreement
  bool agreeToPrivacyPolicy = false;

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
                      'ESG Readiness',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Step 3 of 3',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    
                    SizedBox(height: 30),
                    
                    // Environmental (E) Section
                    Text(
                      'Environmental (E)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Eco-friendly packaging
                    _buildLabel('Do you use eco-friendly packaging?'),
                    _buildRadioGroup(
                      value: usesEcoFriendlyPackaging,
                      onChanged: (value) {
                        setState(() {
                          usesEcoFriendlyPackaging = value;
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Waste management practices
                    _buildLabel('What is/are your waste management practices?'),
                    _buildCheckboxGroup(
                      items: wasteManagementOptions,
                      selectedItems: selectedWasteManagement,
                      onChanged: (item, isSelected) {
                        setState(() {
                          if (isSelected) {
                            selectedWasteManagement.add(item);
                          } else {
                            selectedWasteManagement.remove(item);
                          }
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 30),
                    
                    // Social (S) Section
                    Text(
                      'Social (S)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Number of employees
                    _buildLabel('How many employees do you have?'),
                    _buildDropdown(
                      value: numberOfEmployees,
                      hint: 'Number of Employees',
                      items: employeeOptions,
                      isRequired: true,
                      onChanged: (value) {
                        setState(() {
                          numberOfEmployees = value;
                        });
                      },
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Employee contracts
                    _buildLabel('Do your employees have formal contracts or benefits?'),
                    _buildRadioGroup(
                      value: employeesHaveContracts,
                      onChanged: (value) {
                        setState(() {
                          employeesHaveContracts = value;
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 30),
                    
                    // Governance (G) Section
                    Text(
                      'Governance (G)',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Business registration
                    _buildLabel('Is your business registered (DTI/SEC/Barangay)?'),
                    _buildRadioGroup(
                      value: isBusinessRegistered,
                      onChanged: (value) {
                        setState(() {
                          isBusinessRegistered = value;
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Financial records
                    _buildLabel('Do you keep written or digital financial records?'),
                    _buildRadioGroup(
                      value: keepsFinancialRecords,
                      onChanged: (value) {
                        setState(() {
                          keepsFinancialRecords = value;
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Separate personal and business money
                    _buildLabel('Do you separate personal and business money?'),
                    _buildRadioGroup(
                      value: separatesPersonalBusinessMoney,
                      onChanged: (value) {
                        setState(() {
                          separatesPersonalBusinessMoney = value;
                        });
                      },
                      isRequired: true,
                    ),
                    
                    SizedBox(height: 30),
                    
                    // Privacy Policy Agreement
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: agreeToPrivacyPolicy ? Colors.red : Color(0xFFE5E7EB),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                            color: agreeToPrivacyPolicy ? Colors.red : Colors.transparent,
                          ),
                          child: agreeToPrivacyPolicy
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
                            onTap: () {
                              setState(() {
                                agreeToPrivacyPolicy = !agreeToPrivacyPolicy;
                              });
                            },
                            child: Text(
                              '"I agree to the use of my information to assess my business\' loan readiness."',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    SizedBox(height: 15),
                    
                    // Privacy Policy Link
                    GestureDetector(
                      onTap: () {
                        // Handle privacy policy click
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Opening Privacy Policy...')),
                        );
                      },
                      child: Text(
                        'Click here to view Privacy Policy',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
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
                    SnackBar(content: Text('Form completed successfully!')),
                  );
                } else {
                  // Show validation errors
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill in all required fields and agree to privacy policy'),
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
    
    // Environmental validation
    if (usesEcoFriendlyPackaging == null) {
      isValid = false;
    }
    if (selectedWasteManagement.isEmpty) {
      isValid = false;
    }
    
    // Social validation
    if (numberOfEmployees == null) {
      isValid = false;
    }
    if (employeesHaveContracts == null) {
      isValid = false;
    }
    
    // Governance validation
    if (isBusinessRegistered == null) {
      isValid = false;
    }
    if (keepsFinancialRecords == null) {
      isValid = false;
    }
    if (separatesPersonalBusinessMoney == null) {
      isValid = false;
    }
    
    // Privacy policy agreement
    if (!agreeToPrivacyPolicy) {
      isValid = false;
    }
    
    return isValid;
  }
}