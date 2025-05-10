import 'package:flutter/material.dart';
import '../widgets/custom_toggle_tile.dart';
import '../widgets/qr_code_modal.dart';
import 'login_screen.dart';

class ChildScreen extends StatefulWidget {
  @override
  _ChildScreenState createState() => _ChildScreenState();
}

class _ChildScreenState extends State<ChildScreen> {
  // Özellikler için toggle durumları
  bool ekranHareketi = true;
  bool tarayiciGecmisi = false;
  bool konumTakibi = true;
  bool gorselAnaliz = true;
  bool duyguAnaliz = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          QrCodeModal.show(context);
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // Başlık
                  Text(
                    'E D A\n(Çocuk)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Times New Roman',
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Özellikler',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade900,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Özellik kartları
                  CustomToggleTile(
                    title: 'Ekran Hareketi ve Süresi',
                    value: ekranHareketi,
                    onChanged: (val) => setState(() => ekranHareketi = val),
                  ),
                  CustomToggleTile(
                    title: 'Tarayıcı Geçmişi',
                    value: tarayiciGecmisi,
                    onChanged: (val) => setState(() => tarayiciGecmisi = val),
                  ),
                  CustomToggleTile(
                    title: 'Konum Takibi',
                    value: konumTakibi,
                    onChanged: (val) => setState(() => konumTakibi = val),
                  ),
                  CustomToggleTile(
                    title: 'Görsel Analiz',
                    value: gorselAnaliz,
                    onChanged: (val) => setState(() => gorselAnaliz = val),
                  ),
                  CustomToggleTile(
                    title: 'Duygu Analizi',
                    value: duyguAnaliz,
                    onChanged: (val) => setState(() => duyguAnaliz = val),
                  ),

                  Spacer(),

                  // Gizle butonu
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Gizle işlevi eklenecek
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(40),
                    ),
                    child: Text(
                      'Gizle',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Çıkış Butonu (sağ üst köşe)
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.logout, color: Colors.grey.shade800),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
