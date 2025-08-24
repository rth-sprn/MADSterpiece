import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'no_recommendation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loan Recommendation',
      theme: ThemeData(
        primaryColor: Color(0xFFB11116),
        fontFamily: 'SF Pro Display',
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: LoanRecommendationPage(),
    );
  }
}

class LoanRecommendationPage extends StatefulWidget {
  const LoanRecommendationPage({super.key});
  
  @override
  _LoanRecommendationPageState createState() => _LoanRecommendationPageState();
}

class _LoanRecommendationPageState extends State<LoanRecommendationPage> {
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
                'Recommended Loan Product',
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
            
            // Loan Product Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFF8F9FA),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xFFB9BBBD), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1), // shadow color
                    spreadRadius: 1,   // how wide the shadow spreads
                    blurRadius: 6,     // softens the shadow
                    offset: Offset(0, 3), // moves shadow down (x, y)
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Bank Logo Container
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Color(0xFFE9ECEF)),
                    ),
                    child: Center(
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Color(0xFFB11116),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: Text(
                            'L',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  // Bank Name
                  Text(
                    'NegosyoKo Loan',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 25),
            
            // Loan Details
            _buildDetailRow('Loan Amount:', '₱150,000'),
            SizedBox(height: 10),
            
            RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color(0xFF1A1A1A),
                ),
                children: [
                  TextSpan(
                    text: 'Interest Rate: ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: '1.5% ',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: '(includes 0.25% ESG\ndiscount)',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 10),
            _buildDetailRow('Term:', '18 months'),
            
            SizedBox(height: 25),
            
            // Predicted Repayment Section
            Text(
              'Predicted Repayment',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            
            SizedBox(height: 10),
            
            _buildPaymentDetail('Monthly Payment:', '₱9,357.72'),
            SizedBox(height: 8),
            _buildPaymentDetail('Total Interest:', '₱18,438.93'),
            SizedBox(height: 8),
            _buildPaymentDetail('Total Payable:', '₱168,438.93'),
            
            SizedBox(height: 30),
            
            // Loan Insight Report
            Text(
              'Maria, here\'s your loan insight report:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            
            SizedBox(height: 15),
            
            // Sakto Para sa Negosyo Mo Section
            Text(
              '1. Sakto Para sa Negosyo Mo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            
            SizedBox(height: 10),
            
            Text(
              'Pasok ka na sa ₱150,000 loan. Your loan-trust score ay 82/100 — '
              'ibig sabihin, maganda ang chance mo ma-approve dahil stable ang kita mo '
              'at kumpleto ka na ng mga pangunahing requirements (DTI permit, barangay '
              'clearance, valid ID).',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF1A1A1A),
                height: 1.4,
                fontStyle: FontStyle.italic,
              ),
            ),
            
            SizedBox(height: 12),

            // Sakto Para sa Negosyo Mo Section
            Text(
              '2. Bakit ok ito para sa\'yo?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            
            SizedBox(height: 10),
            
            Text(
              'Kaya ng monthly profit mo (₱25k) bayaran ang hulog ng loan at may '
              'matitira pa para sa pang-araw-araw na gastos. Ngayon, pwede ka mag-loan ' 
              'hanggang ₱150k kahit walang collateral (walang kailangang ipasang gamit). '
              'Pero kung magdadagdag ka ng asset gaya ng sasakyan o equipment, mas tataas '
              'ang chance na makakuha ng mas malaking loan na mas mababa pa ang interes. ',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF1A1A1A),
                height: 1.4,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A1A),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildPaymentDetail(String label, String amount) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: Color(0xFF1A1A1A),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
          ),
          SizedBox(width: 8),
          Text(
            amount,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }
}