import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CountrySelectionScreen extends StatefulWidget {
  @override
  _CountrySelectionScreenState createState() => _CountrySelectionScreenState();
}

class _CountrySelectionScreenState extends State<CountrySelectionScreen> {
  String? selectedCountry;
  bool isDropdownOpened = false;

  final List<Map<String, String>> countries = [
    {"name": "Bangladesh", "code": "bd"},
    {"name": "United States", "code": "us"},
    {"name": "Singapore", "code": "sg"},
    {"name": "India", "code": "in"},
  ];

  String flagUrl(String countryCode) {
    return "https://flagcdn.com/w20/$countryCode.png";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Stack(
          children: [
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.chevron_left, color: Colors.black, size: 30),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // Garis menyatu antara biru dan abu-abu
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  Container(
                    width: 55, // Lebar yang sama dengan leading IconButton
                    height: 4, // Ketebalan garis biru
                    color:
                        const Color.fromARGB(255, 15, 106, 181), // Warna biru
                  ),
                  Expanded(
                    child: Container(
                      height: 4, // Ketebalan garis abu-abu
                      color: Colors.grey.shade300,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Country of residence",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "This info needs to be accurate with your ID document",
              style: TextStyle(color: const Color.fromARGB(255, 79, 79, 79)),
            ),
            SizedBox(height: 20),
            Text(
              "Country",
              style: TextStyle(color: const Color.fromARGB(255, 79, 79, 79)),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField2(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              isExpanded: true,
              hint: Text('Select Country'),
              value: selectedCountry,
              items: countries
                  .map((country) => DropdownMenuItem<String>(
                        value: country['name'],
                        child: Row(
                          children: [
                            Image.network(
                              flagUrl(country['code']!),
                              width: 30,
                              height: 20,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.flag, color: Colors.grey);
                              },
                            ),
                            SizedBox(width: 10),
                            Text(country['name']!),
                            Spacer(),
                            if (selectedCountry == country['name'] &&
                                !isDropdownOpened)
                              Icon(Icons.check,
                                  color: const Color.fromARGB(255, 92, 94, 96)),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value as String?;
                });
              },
              onMenuStateChange: (isOpen) {
                setState(() {
                  isDropdownOpened = isOpen;
                });
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: selectedCountry != null
                  ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Selected Country: $selectedCountry'),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedCountry != null
                    ? const Color.fromARGB(255, 15, 106, 181)
                    : Colors.grey.shade400,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
