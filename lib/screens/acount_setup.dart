import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeAddressScreen(),
    );
  }
}

class HomeAddressScreen extends StatefulWidget {
  const HomeAddressScreen({super.key});

  @override
  _HomeAddressScreenState createState() => _HomeAddressScreenState();
}

class _HomeAddressScreenState extends State<HomeAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  // Tambahkan controller untuk setiap TextFormField
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postcodeController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers ketika tidak lagi digunakan untuk menghindari memory leak
    _addressController.dispose();
    _cityController.dispose();
    _postcodeController.dispose();
    super.dispose();
  }

  // Fungsi untuk validasi dan mengirim data
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Jika form valid, ambil data dari controller
      String address = _addressController.text;
      String city = _cityController.text;
      String postcode = _postcodeController.text;

      // Kirim data atau lakukan sesuatu dengan data tersebut
      print('Address: $address');
      print('City: $city');
      print('Postcode: $postcode');

      // Contoh: Navigasi ke halaman berikutnya
      // Navigator.of(context).pushNamed('/nextPage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Home address',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'This info needs to be accurate with your ID document.',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _addressController, // Tambahkan controller
                decoration: const InputDecoration(
                  labelText: 'Address Line',
                  hintText: 'Mr. Jhon Doe',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _cityController, // Tambahkan controller
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'City, State',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _postcodeController, // Tambahkan controller
                decoration: const InputDecoration(
                  labelText: 'Postcode',
                  hintText: 'Ex: 00000',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your postcode';
                  }
                  return null;
                },
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      _submitForm, // Panggil fungsi submit ketika tombol ditekan
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}