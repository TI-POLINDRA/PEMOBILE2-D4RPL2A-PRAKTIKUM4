import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  bool _isLoading = false;
  String _selectedCountry = '+880';
  final List<Map<String, String>> _countries = [
    {'code': '+880', 'flag': 'https://flagcdn.com/w320/bd.png'},
    {'code': '+91', 'flag': 'https://flagcdn.com/w320/in.png'},
    {'code': '+1', 'flag': 'https://flagcdn.com/w320/us.png'},
    {'code': '+62', 'flag': 'https://flagcdn.com/w320/id.png'},
    {'code': '+44', 'flag': 'https://flagcdn.com/w320/gb.png'},
    {'code': '+81', 'flag': 'https://flagcdn.com/w320/jp.png'},
    {'code': '+61', 'flag': 'https://flagcdn.com/w320/au.png'},
    {'code': '+86', 'flag': 'https://flagcdn.com/w320/cn.png'},
    {'code': '+33', 'flag': 'https://flagcdn.com/w320/fr.png'},
    {'code': '+49', 'flag': 'https://flagcdn.com/w320/de.png'},
    {'code': '+7', 'flag': 'https://flagcdn.com/w320/ru.png'},
    {'code': '+55', 'flag': 'https://flagcdn.com/w320/br.png'},
    {'code': '+39', 'flag': 'https://flagcdn.com/w320/it.png'},
    {'code': '+34', 'flag': 'https://flagcdn.com/w320/es.png'},
    {'code': '+1', 'flag': 'https://flagcdn.com/w320/ca.png'},
    {'code': '+971', 'flag': 'https://flagcdn.com/w320/ae.png'},
    {'code': '+27', 'flag': 'https://flagcdn.com/w320/za.png'},
    {'code': '+82', 'flag': 'https://flagcdn.com/w320/kr.png'},
    {'code': '+66', 'flag': 'https://flagcdn.com/w320/th.png'},
    {'code': '+965', 'flag': 'https://flagcdn.com/w320/kw.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: AnimatedContainer(
            duration: Duration(seconds: 4), // Animasi lebih pelan
            curve: Curves.easeInOut,
            height: 2.0,
            alignment: Alignment.centerLeft, // Mulai dari kiri
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: _isLoading ? 1.0 : 0.0, // Faktor lebar animasi
              child: Container(
                height: 2.0,
                color: _isLoading ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create an Account",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.sp),
            ),
            SizedBox(height: 10.h),
            Text(
              "Enter your mobile number to verify your account",
              style: TextStyle(color: Colors.grey, fontSize: 14.sp),
            ),
            SizedBox(height: 20.h),
            Text("Phone"),
            SizedBox(height: 10.h),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedCountry,
                          items: _countries.map((country) {
                            return DropdownMenuItem<String>(
                              value: country['code'],
                              child: Row(
                                children: [
                                  Image.network(
                                    country['flag']!,
                                    width: 30.w,
                                    height: 20.h,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(country['code']!),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCountry = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                hintText: "Mobile number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text("Password"),
            SizedBox(height: 10.h),
            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });
                  Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      _isLoading = false;
                    });
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            Lottie.asset(
                              'assets/animations/email.json',
                              width: 150.w,
                              height: 150.h,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "Verify your phone number before we send code",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(
                                  color: Color.fromARGB(255, 111, 110, 110),
                                  fontSize: 14.sp,
                                ),
                                children: [
                                  TextSpan(text: "Is this correct? "),
                                  TextSpan(
                                    text: "+880 1995 86 74 06",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[800],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                child: Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.h),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.blue[800]!),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                ),
                                child: Text("No"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
