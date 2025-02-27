import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectPurposePage(),
    );
  }
}

class SelectPurposePage extends StatefulWidget {
  @override
  _SelectPurposePageState createState() => _SelectPurposePageState();
}

class _SelectPurposePageState extends State<SelectPurposePage> {
  String _selectedPurpose = 'Personal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select a Purpose",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              "Select a Method for Sending Money",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            SizedBox(height: 20),
            buildPurposeOption(
              title: "Personal",
              subtitle: "Pay your friends and family.",
              icon: Icons.person_outline,
              iconColor: const Color.fromARGB(255, 110, 190, 255),
              borderColor: _selectedPurpose == 'Personal' ? Colors.blue : Colors.grey.shade300,
              isSelected: _selectedPurpose == 'Personal',
              onTap: () {
                setState(() {
                  _selectedPurpose = 'Personal';
                });
              },
            ),
            SizedBox(height: 10),
            buildPurposeOption(
              title: "Business",
              subtitle: "Pay your employee",
              icon: Icons.business_center_outlined,
              iconColor: const Color.fromARGB(255, 255, 196, 107),
              borderColor: _selectedPurpose == 'Business' ? Colors.blue : Colors.grey.shade300,
              isSelected: _selectedPurpose == 'Business',
              onTap: () {
                setState(() {
                  _selectedPurpose = 'Business';
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPurposeOption({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color borderColor,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.2),
            child: Icon(icon, color: iconColor),
          ),
          title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          subtitle: Text(subtitle),
          trailing: Radio(
            value: title,
            groupValue: _selectedPurpose,
            onChanged: (value) {
              setState(() {
                _selectedPurpose = value.toString();
              });
            },
            activeColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}