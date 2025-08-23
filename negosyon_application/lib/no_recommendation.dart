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
      title: 'No Recommendation',
      theme: ThemeData(
        primaryColor: Color(0xFFB11116),
        fontFamily: 'SF Pro Display',
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: NoRecommendationPage(),
    );
  }
}

class NoRecommendationPage extends StatefulWidget {
  @override
  _NoRecommendationPageState createState() => _NoRecommendationPageState();
}

class _NoRecommendationPageState extends State<NoRecommendationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0, // (Flutter 3.7+) disable scroll color change
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color(0xFFB11116), size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Back',
          style: TextStyle(
            color: Color(0xFFB11116),
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: false,
        titleSpacing: -10,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Center(
              child: Text(
                'No Recommendation for you yet',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            SizedBox(height: 25),
            
            // Description
            Text(
              'Maria, wala pa akong ma-rerecommend na loan product sa iyo sa ngayon kasi may '
              'kulang pa sa requirements mo. Pero good news — malapit ka na! Konting hakbang na '
              'lang at pwede ka nang makakuha ng mas magandang offer.',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF1A1A1A),
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            
            SizedBox(height: 25),
            
            // Kulang Section
            Text(
              'Ano pa ang iyong mga kulang?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            
            SizedBox(height: 20),
            
            // Kulang List
            _buildRequirementItem(
              'BIR Certificate of Registration – ito ang magpapatunay na rehistrado ang negosyo mo. '
              'Maari mong iupload ang iyong dokumento sa dashboard “Documents”.',
              '',
            ),
            
            SizedBox(height: 10),
            
            _buildRequirementItem(
              '(Optional) Collateral – gaya ng motor, maliit na equipment, o appliance. Pwede nitong '
              'itaas ang loan limit mo hanggang ₱250,000 at bawasan ang interest.',
              '',
            ),
            
            SizedBox(height: 30),
            
            // Mayroon Section
            Text(
              'Mga bagay na mayroon ka sa ngayon:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            
            SizedBox(height: 20),
            
            // Mayroon List
            _buildHaveItem(
              '✔ May DTI permit at barangay clearance ka na',
            ),
            
            SizedBox(height: 10),
            
            _buildHaveItem(
              '✔ Stable monthly kita (₱25k) – magandang sign!',
            ),
            
            SizedBox(height: 10),
            
            _buildHaveItem(
              '✔ Gumagamit ka na ng solar lighting (nakakatulong sa ESG score mo).',
              '',
              true,
            ),

            SizedBox(height: 30),
            
            // Next Steps Section
            Text(
              'Next Steps for You:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            
            SizedBox(height: 20),
            
            // Next Steps List
            _buildNextStepItem(
              '1. I-upload ang mga kulang na documents sa dashboard para makumpleto ang requirements.',
            ),
            
            SizedBox(height: 10),
            
            _buildNextStepItem(
              '2. I-track buwan-buwan ang kita at gastos — mas maganda kung may digital record, '
              'kasi mas madali itong i-verify.',
            ),
            
            SizedBox(height: 10),
            
            _buildNextStepItem(
              '3. Dagdagan ang ESG practices (hal. paggamit ng recyclable packaging, pag-manage ng waste). '
              'Mas mataas ang ESG score = mas mababang interest.',
              '',
              true,
            ),

            SizedBox(height: 30),
            
            // Pro Tips Section
            Text(
              'Pro Tips for Stronger Loan Offers:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            
            SizedBox(height: 20),
            
            // Pro Tips List
            _buildTipsItem(
              '💡 Keep at least ₱10k emergency fund para ready ka kung may bumaba sa sales.',
            ),
            
            SizedBox(height: 10),
            
            _buildTipsItem(
              '💡 If kaya, gumamit ng small POS (Point-of-Sale) app — parang digital cashier system '
              '— para mas malinaw ang record ng sales at mas tumaas ang tiwala ng bangko sa negosyo mo.',
            ),
            
            SizedBox(height: 10),
            
            _buildTipsItem(
              '💡 Sa susunod na cycle, pwede ka nang makakuha ng mas malaking loan kung tuloy-tuloy ang '
              'digital transactions mo at may collateral ka.',
              '',
              true,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildRequirementItem(String mainText, String subText, {bool isItalic = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: mainText,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (subText.isNotEmpty)
                      TextSpan(
                        text: subText,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildNextStepItem(String mainText, [String? italicSuffix, bool hasItalicSuffix = false]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(text: mainText),
                if (hasItalicSuffix && italicSuffix != null)
                  TextSpan(
                    text: italicSuffix,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHaveItem(String mainText, [String? italicSuffix, bool hasItalicSuffix = false]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(text: mainText),
                if (hasItalicSuffix && italicSuffix != null)
                  TextSpan(
                    text: italicSuffix,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTipsItem(String mainText, [String? italicSuffix, bool hasItalicSuffix = false]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 8),
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                height: 1.5,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(text: mainText),
                if (hasItalicSuffix && italicSuffix != null)
                  TextSpan(
                    text: italicSuffix,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}