import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RouterCheck extends StatefulWidget {
  const RouterCheck({super.key});

  @override
  _RouterCheckState createState() => _RouterCheckState();
}

class _RouterCheckState extends State<RouterCheck> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Route Check")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  hintText: 'Masukkan Alamat Routing',
                  helperText: 'Contoh: /login atau /otp',
                  icon: const Icon(Icons.route),
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  String route = _controller.text;
                  if (route.isNotEmpty) {
                    print('Goto Route : ${route}');
                    Navigator.pushNamed(context, route);
                  }
                },
                child: const Text("Go"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
