import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Chat UI',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ChatScreen(),
        );
      },
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8E6E8),
      appBar: AppBar(
        backgroundColor: Color(0xFFE8E6E8),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text('Support', style: TextStyle(fontSize: 20, color: Colors.black)),
            SizedBox(height: 4.h),
            Text('Sunday at 4:20 PM', style: TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              children: <Widget>[
                _buildChatBubble(
                  senderName: 'Coin Helper Bot', 
                  message: 'Welcome to CoinPay support! How can we assist you today?',
                  isUser: false,
                ),
                SizedBox(height: 8.h),
                _buildChatBubble(
                  message: 'Are you having a problem with a specific feature?',
                  isUser: false,
                ),
                SizedBox(height: 8.h),
                _buildChatBubble(
                  message: 'Have you tried troubleshooting steps in our FAQ?',
                  isUser: false,
                  time: 'Just now',
                ),
                _buildChatBubble(
                  message: 'I need help regarding my Coinpay account. I can’t send money.',
                  isUser: true,
                  time: 'Sent',
                ),
                SizedBox(height: 16.h),
                TypingIndicator(),
              ],
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

Widget _buildChatBubble({
  required String message,
  required bool isUser,
  String? time,
  String? senderName, // Menampilkan nama pengirim (bot)
}) {
  bool showBotIcon = !isUser && message == 'Have you tried troubleshooting steps in our FAQ?';

  return Column(
    crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    children: <Widget>[
      if (!isUser && senderName != null) 
        Padding(
          padding: EdgeInsets.only(left: 55.w, bottom: 2.h),
          child: Text(senderName, style: TextStyle(color: Colors.grey, fontSize: 12.sp, fontWeight: FontWeight.bold)),
        ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          if (!isUser && showBotIcon) ...[
            CircleAvatar(radius: 20.r, backgroundImage: AssetImage('lib/assets/bot_icon.png')),
            SizedBox(width: 8.w),
          ] else if (!isUser) ...[
            SizedBox(width: 48.w),
          ],
          Flexible(
            child: Container(
              padding: EdgeInsets.all(12.w),
              constraints: BoxConstraints(maxWidth: 250.w),
              decoration: BoxDecoration(
                color: isUser ? const Color.fromARGB(255, 6, 106, 187) : const Color.fromARGB(255, 255, 254, 254),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: isUser ? Colors.white : Colors.black,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),
          if (isUser) ...[
            SizedBox(width: 8.w),
            CircleAvatar(radius: 20.r, backgroundImage: AssetImage('lib/assets/user_image.png')),
          ],
        ],
      ),
      if (time != null)
        Padding(
          padding: EdgeInsets.only(left: isUser ? 0 : 55.w, right: isUser ? 55.w : 0, top: 2.h),
          child: Align(
            alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(time, style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
          ),
        ),
    ],
  );
}



  Widget _buildInputArea() {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 12.h),
      child: Row(
        children: <Widget>[
          Icon(Icons.attachment, color: Colors.grey),
          SizedBox(width: 8.w),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                border: Border.all(color: Colors.blue, width: 1),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: InputBorder.none,
                      ),
                      cursorColor: Colors.blue,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TypingIndicator extends StatefulWidget {
  @override
  _TypingIndicatorState createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('lib/assets/bot_icon.png'),
            radius: 20.r,
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12.r),
                ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(3, (index) {
                  final colors = [const Color.fromARGB(255, 61, 60, 60), const Color.fromARGB(255, 125, 125, 125), const Color.fromARGB(255, 190, 191, 190)]; // Warna berbeda untuk tiap titik
                  return AnimatedOpacity(
                    opacity: _controller.value > index * 0.3 ? 1.0 : 0.3,
                    duration: Duration(milliseconds: 300),
      child: Icon(Icons.circle, size: 10.w, color: colors[index]),
    );
  }),
),

              ),
              SizedBox(height: 4.h),
              Text('Typing...', style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
