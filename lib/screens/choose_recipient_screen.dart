import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseRecipientScreen extends StatefulWidget {
  const ChooseRecipientScreen({super.key});

  @override
  _ChooseRecipientScreenState createState() => _ChooseRecipientScreenState();
}

class _ChooseRecipientScreenState extends State<ChooseRecipientScreen> {
  final List<Map<String, String>> recipients = [
    {"name": "Mehedi Hasan", "email": "helloyouthmind@gmail.com", "amount": "-\$100"},
    {"name": "John Doe", "email": "john.doe@email.com", "amount": "-\$50"},
    {"name": "Jane Smith", "email": "jane.smith@email.com", "amount": "-\$30"},
    {"name": "Alice Brown", "email": "alice.brown@email.com", "amount": "-\$70"},
    {"name": "Robert White", "email": "robert.white@email.com", "amount": "-\$120"},
  ];

  String searchText = '';

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredRecipients = recipients
        .where((recipient) =>
            recipient["email"]!.toLowerCase().contains(searchText.toLowerCase()))
        .toList(); // Hanya mencari berdasarkan email

    bool isSearching = searchText.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (isSearching)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    searchText = "";
                  });
                },
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur lembut
                    child: Container(
                      color: Colors.grey.withOpacity(0.35), // Overlay transparan sedikit pekat
                    ),
                  ),
                ),
              ),
            ),


          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, size: 24),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Choose Recipient",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  Text(
                    "Please select your recipient to receive money.",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 15),

                  TextField(
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      hintText: 'Search by email',
                      hintStyle: GoogleFonts.poppins(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 10),

                  if (isSearching && filteredRecipients.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Send to",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 10),
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage('assets/profile.jpg'),
                              radius: 25,
                            ),
                            title: Text(
                              filteredRecipients.first["name"]!,
                              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              filteredRecipients.first["email"]!,
                              style: GoogleFonts.poppins(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 20),

                  Text(
                    "Most Recent",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Expanded(
                    child: ListView.builder(
                      itemCount: recipients.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: AssetImage('assets/profile.jpg'),
                            radius: 25,
                          ),
                          title: Text(
                            recipients[index]["name"]!,
                            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            recipients[index]["email"]!,
                            style: GoogleFonts.poppins(color: Colors.grey),
                          ),
                          trailing: Text(
                            recipients[index]["amount"]!,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Center(
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.qr_code_scanner, size: 40, color: Colors.blue),
                          onPressed: () {},
                        ),
                        Text(
                          "Scan to Pay",
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                      ],
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
