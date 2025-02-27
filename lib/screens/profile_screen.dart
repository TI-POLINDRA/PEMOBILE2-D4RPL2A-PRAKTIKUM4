import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Menyesuaikan agar lebih ke atas
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select a Purpose",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("Select a Method for Sending Money"),
            SizedBox(height: 20),

            // Card Profil
            Center(
              child: Container(
                padding: EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://via.placeholder.com/150",
                      ), // Ganti URL dengan gambar asli
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Mehedi Hasan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("helloyouthmind@gmail.com"),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Text("Choose Account", textAlign: TextAlign.center),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: Row(
                children: [
                  Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/0/04/Mastercard-logo.png",
                    width: 30,
                  ),
                  SizedBox(width: 10),
                  Expanded(child: Text("Account  •••• 3994")),
                  Radio(value: true, groupValue: true, onChanged: (value) {}),
                ],
              ),
            ),

            SizedBox(height: 20), // Jarak sebelum tombol
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: Text("Pay \$500", style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
