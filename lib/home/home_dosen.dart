import 'package:flutter/material.dart';

class JadwalSidangPage extends StatefulWidget {
  const JadwalSidangPage({super.key});
  @override
  _JadwalSidangPageState createState() => _JadwalSidangPageState();
}

class _JadwalSidangPageState extends State<JadwalSidangPage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> jadwalSidang = [
    {'hari': 'Rabu', 'tanggal': '2 Oktober 2024'},
    {'hari': 'Kamis', 'tanggal': '3 Oktober 2024'},
    {'hari': 'Jum\'at', 'tanggal': '4 Oktober 2024'},
    {'hari': 'Senin', 'tanggal': '7 Oktober 2024'},
    {'hari': 'Selasa', 'tanggal': '8 Oktober 2024'},
    {'hari': 'Rabu', 'tanggal': '9 Oktober 2024'},
    {'hari': 'Kamis', 'tanggal': '10 Oktober 2024'},
    {'hari': 'Jum\'at', 'tanggal': '11 Oktober 2024'},
    {'hari': 'Senin', 'tanggal': '14 Oktober 2024'},
    {'hari': 'Selasa', 'tanggal': '15 Oktober 2024'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol Kembali di Kiri Atas
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Aksi tombol kembali
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFF0068FF), // Warna biru background
                        shape: BoxShape.circle, // Bentuk lingkaran
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white, // Warna icon
                      ),
                    ),
                  ),

                  // Nama dan Profil di Kanan Atas
                  Row(
                    children: [
                      Text(
                        'WIKTASARI , S.T., M.Kom.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10), // Jarak antara teks dan foto profil
                      CircleAvatar(
                        radius: 30, // Ukuran lingkaran profil
                        backgroundImage: AssetImage(
                            'assets/images/org.png'), // Ganti dengan path image Anda
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Konten Utama
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Jadwal Sidang Tugas Akhir',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold, // Poppins Bold 15
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: jadwalSidang.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        '${jadwalSidang[index]['hari']}, ${jadwalSidang[index]['tanggal']}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500, // Poppins Medium 14
                        ),
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Aksi saat tombol "Lihat" ditekan
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Color(0xFF0068FF), // Warna biru tombol
                        ),
                        child: Text(
                          'Lihat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.normal, // Poppins Regular 13
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20), // Jarak dari bagian bawah layar
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20), // Membuat sisi rounded
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/rumah.png",
                  width: 32,
                  height: 32,
                  color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/org2.png',
                  width: 32,
                  height: 32,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                ),
                label: 'Bimbingan',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/catatan.png',
                  width: 32,
                  height: 32,
                  color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
                ),
                label: 'Menguji',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/org.png',
                  width: 32,
                  height: 32,
                  color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
