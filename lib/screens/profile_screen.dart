import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade100,
          child: Column(
            children: [
              _buildCardContainer(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              // Tambahkan aksi klik di sini
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40.r,
                                  backgroundImage: NetworkImage(
                                    "https://i.ibb.co.com/HQMXpxc/banana-to-the-moon.jpg", // Ganti URL sesuai kebutuhan
                                  ),
                                ),
                                Container(
                                  width: 80.r, // Sesuaikan dengan ukuran Avatar
                                  height: 80.r,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(
                                      0.3,
                                    ), // Transparan di tengah
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 25,
                                    color: Colors.grey.shade100.withOpacity(
                                      0.8,
                                    ), // Icon transparan
                                  ),
                                ),
                                // Positioned(
                                //   bottom: 0,
                                //   right: 0,
                                //   // child: Container(
                                //   //   padding: EdgeInsets.all(6.w),
                                //   //   decoration: BoxDecoration(
                                //   //     // color: Colors.grey.shade200,
                                //   //     shape: BoxShape.circle,
                                //   //     boxShadow: [
                                //   //       BoxShadow(
                                //   //         color: Colors.black.withOpacity(0.1),
                                //   //         blurRadius: 6.r,
                                //   //         spreadRadius: 1.r,
                                //   //         offset: Offset(0, 3),
                                //   //       ),
                                //   //     ],
                                //   //   ),
                                //     // child: Icon(
                                //     //   Icons.camera_alt,
                                //     //   size: 18,
                                //     //   color: Colors.black,
                                //     // ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          "Mehedi Hasan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                          ),
                        ),
                        Text(
                          "helloyouthmind@gmail.com",
                          style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                        ),
                        Text(
                          "+8801995867406",
                          style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(
                        Icons.edit_square,
                        size: 23,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              _buildCardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10), // Jarak atas
                    ListTile(
                      leading: Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6.r,
                              spreadRadius: 1.r,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(Icons.dark_mode, color: Colors.black),
                      ),
                      title: Text("Dark Mode"),
                      trailing: Transform.scale(
                        scale:
                            0.8, // Mengecilkan ukuran switch secara keseluruhan
                        child: Switch(
                          value: false,
                          onChanged: (value) {},
                          activeColor: Colors.blue, // Warna saat aktif
                          inactiveTrackColor: Colors
                              .grey.shade300, // Warna background saat mati
                          inactiveThumbColor:
                              Colors.white, // Warna tombol saat mati
                          materialTapTargetSize: MaterialTapTargetSize
                              .shrinkWrap, // Biar minimalis
                          trackOutlineColor: MaterialStateProperty.all(
                            Colors.transparent,
                          ), // Hilangin garis tepi
                          thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
                              (states) {
                            return Icon(
                              Icons.circle,
                              size: 8, // Ukuran bulatan lebih kecil
                              color: Colors.white,
                            );
                          }),
                          thumbColor: MaterialStateProperty.resolveWith<Color>(
                              (states) {
                            return Colors.white;
                          }),
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // Jarak antara item
                    Divider(),
                    _buildProfileOption(
                      Icons.person,
                      "Personal Info",
                      Colors.blue,
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    _buildProfileOption(
                      Icons.account_balance_wallet,
                      "Bank & Cards",
                      Colors.amber,
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    _buildProfileOption(
                      Icons.receipt,
                      "Transaction",
                      Colors.redAccent,
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    _buildProfileOption(
                      Icons.settings,
                      "Settings",
                      Colors.blueAccent,
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    _buildProfileOption(
                      Icons.privacy_tip,
                      "Data Privacy",
                      Colors.green,
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    _buildProfileOption(
                      Icons.help,
                      "Help & Support",
                      Colors.orange,
                    ),
                    SizedBox(height: 10),
                    Divider(),
                    _buildProfileOption(Icons.info, "About App", Colors.purple),
                    SizedBox(height: 10),
                    Divider(),
                    _buildProfileOption(Icons.logout, "Logout", Colors.red),
                    SizedBox(height: 20), // Jarak bawah
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade100,
        currentIndex: 4, // Posisi Profile
        selectedItemColor: Colors.blue, // Warna aktif
        unselectedItemColor: Colors.black, // Warna nonaktif
        showUnselectedLabels: false, // Sembunyikan label
        showSelectedLabels: false, // Sembunyikan label
        type: BottomNavigationBarType.fixed, // Biar gak geser
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_outline), label: ""),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.blue, // Lingkaran biru
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10), // Biar tidak lancip
              ),
              padding: EdgeInsets.all(10), // Biar icon pas di tengah
              child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person),
                Container(
                  width: 6,
                  height: 6,
                  margin: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue, // Titik biru di bawah icon aktif
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            label: "",
          ),
        ],
      ),
    );
  }

  Container _buildCardContainer({required Widget child}) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.r,
            spreadRadius: 2.r,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  ListTile _buildProfileOption(IconData icon, String title, Color iconColor) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.2),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6.r,
              spreadRadius: 1.r,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
