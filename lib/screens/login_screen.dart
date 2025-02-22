import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {},
                child: Text("Login", style: TextStyle(fontSize: 18.sp)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
