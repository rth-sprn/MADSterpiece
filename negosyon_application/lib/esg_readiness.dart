import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'business_form_end.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ESG Readiness',
      theme: ThemeData(
        primaryColor: Color(0xFFB11116),
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
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Step 3 of 3',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Color(0xFFB11116),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 30),

                    // Environmental (E)
                    Text(
                      'Environmental (E)',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildLabel('Do you use eco-friendly packaging?'),
                    _buildRadioGroup(
                      value: usesEcoFriendlyPackaging,
                      onChanged: (value) {
                        setState(() {
                          usesEcoFriendlyPackaging = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    _buildLabel('What is/are your waste management practices?'),
                    _buildCheckboxGroup(
                      items: wasteManagementOptions,
                      selectedItems: selectedWasteManagement,
                      onChanged: (item, isSelected) {
                        setState(() {
                          isSelected
                              ? selectedWasteManagement.add(item)
                              : selectedWasteManagement.remove(item);
                        });
                      },
                    ),
                    SizedBox(height: 30),

                    // Social (S)
                    Text(
                      'Social (S)',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildLabel('How many employees do you have?'),
                    _buildDropdown(
                      value: numberOfEmployees,
                      hint: 'Number of Employees',
                      items: employeeOptions,
                      onChanged: (value) {
                        setState(() {
                          numberOfEmployees = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    _buildLabel('Do your employees have formal contracts or benefits?'),
                    _buildRadioGroup(
                      value: employeesHaveContracts,
                      onChanged: (value) {
                        setState(() {
                          employeesHaveContracts = value;
                        });
                      },
                    ),
                    SizedBox(height: 30),

                    // Governance (G)
                    Text(
                      'Governance (G)',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildLabel('Is your business registered (DTI/SEC/Barangay)?'),
                    _buildRadioGroup(
                      value: isBusinessRegistered,
                      onChanged: (value) {
                        setState(() {
                          isBusinessRegistered = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    _buildLabel('Do you keep written or digital financial records?'),
                    _buildRadioGroup(
                      value: keepsFinancialRecords,
                      onChanged: (value) {
                        setState(() {
                          keepsFinancialRecords = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    _buildLabel('Do you separate personal and business money?'),
                    _buildRadioGroup(
                      value: separatesPersonalBusinessMoney,
                      onChanged: (value) {
                        setState(() {
                          separatesPersonalBusinessMoney = value;
                        });
                      },
                    ),
                    SizedBox(height: 30),

                    // Privacy Policy
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: agreeToPrivacyPolicy ? Color(0xFFB11116) : Color(0xFFE5E7EB),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                            color: agreeToPrivacyPolicy ? Color(0xFFB11116) : Colors.transparent,
                          ),
                          child: agreeToPrivacyPolicy
                              ? Icon(Icons.check, size: 14, color: Colors.white)
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
                              style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF1A1A1A), height: 1.4),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Opening Privacy Policy...')),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: GoogleFonts.poppins(fontSize: 16, color: Color(0xFF1A1A1A)), // default text style
                          children: [
                            TextSpan(text: 'Click here to view '), // normal text
                            TextSpan(
                              text: 'Privacy Policy', // link text
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
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
                if (_validateForm()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoanEndScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Please complete all required fields',
                        style: GoogleFonts.poppins(),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFB11116),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Next',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          )
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
            TextSpan(text: '* ', style: GoogleFonts.poppins(color: Colors.red, fontSize: 16, fontWeight: FontWeight.w500)),
            TextSpan(text: text, style: GoogleFonts.poppins(color: Color(0xFF1A1A1A), fontSize: 16, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxGroup({
    required List<String> items,
    required List<String> selectedItems,
    required Function(String, bool) onChanged,
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
                    color: isSelected ? Color(0xFFB11116) : Color(0xFFE5E7EB),
                    width: 2,
                  ),
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
        );
      }).toList(),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE5E7EB)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.poppins(color: Color(0xFF9CA3AF), fontSize: 16),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
        ),
        items: items.map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item, style: GoogleFonts.poppins(fontSize: 16, color: Color(0xFF1A1A1A))),
        )).toList(),
        onChanged: onChanged,
        icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF9CA3AF)),
      ),
    );
  }

  Widget _buildRadioGroup({
    required bool? value,
    required Function(bool?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // align text properly
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
    bool isValid = true;
    if (usesEcoFriendlyPackaging == null || selectedWasteManagement.isEmpty) isValid = false;
    if (numberOfEmployees == null || employeesHaveContracts == null) isValid = false;
    if (isBusinessRegistered == null || keepsFinancialRecords == null || separatesPersonalBusinessMoney == null) isValid = false;
    if (!agreeToPrivacyPolicy) isValid = false;
    return isValid;
  }
}