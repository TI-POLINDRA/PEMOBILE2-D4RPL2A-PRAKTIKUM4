import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  bool isButtonEnabled = false;

  void _onOTPChanged(String value) {
    setState(() {
      isButtonEnabled = value.length == 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(30),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              child: Icon(Icons.chevron_left, color: Colors.black),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 8),
              width: 40,
              height: 3.0,
              color: Color.fromRGBO(48, 79, 255, 1),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Naikkan teks lebih ke atas
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Confirm your phone",
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "We sent 6 digits code to +881 1720 84 57 57",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: 220, // Menyesuaikan lebar agar lebih kecil ke tengah
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  onChanged: _onOTPChanged,
                  keyboardType: TextInputType.number,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(48, 79, 255, 1),
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.underline,
                    fieldHeight: 60, // Lebih kecil
                    fieldWidth: 30,  // Lebih kecil
                    inactiveColor: Colors.grey,
                    activeColor: Color.fromRGBO(48, 79, 255, 1),
                    selectedColor: Color.fromRGBO(48, 79, 255, 1),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn’t get a code?", style: TextStyle(color: Colors.black)),
                SizedBox(width: 4),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Resend",
                    style: TextStyle(
                      color: Color.fromRGBO(48, 79, 255, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: ElevatedButton(
          onPressed: isButtonEnabled ? () {} : null,
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: isButtonEnabled ? Color.fromRGBO(48, 79, 255, 1) : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            "Verify Your Number",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
