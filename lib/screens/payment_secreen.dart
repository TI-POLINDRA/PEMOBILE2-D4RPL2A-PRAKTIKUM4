import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController amountController = TextEditingController(
    text: "500",
  );
  String selectedCountry = 'us';

  final List<Map<String, String>> countryFlags = [
    {"code": "us", "name": "United States"},
    {"code": "id", "name": "Indonesia"},
    {"code": "gb", "name": "United Kingdom"},
    {"code": "jp", "name": "Japan"},
  ];

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Country",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: ListView.separated(
                    itemCount: countryFlags.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final country = countryFlags[index];
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(
                            "assets/flags/${country['code']}.png",
                          ),
                        ),
                        title: Text(
                          country['name']!,
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                        onTap: () {
                          setState(() {
                            selectedCountry = country['code']!;
                          });
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {},
        ),
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter Amount",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Please enter an amount to get paid",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        'assets/profile/DSC09119.jpg',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Mehedi Hasan",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "helloyouthmind@gmail.com",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 10),

                    InkWell(
                      onTap: _showCountryPicker,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 12, // Ukuran bendera lebih kecil
                            backgroundImage: AssetImage(
                              "assets/flags/$selectedCountry.png",
                            ),
                          ),
                          const SizedBox(width: 5), // Jarak lebih dekat
                          IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 20,
                            ), // Icon lebih kecil
                            onPressed: _showCountryPicker,
                            padding:
                                EdgeInsets.zero, // Hilangkan padding default
                            constraints:
                                const BoxConstraints(), // Sesuaikan ukuran
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Input jumlah
                    SizedBox(
                      width: 200,
                      child: TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 2,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Tombol Continue
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Continue",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
