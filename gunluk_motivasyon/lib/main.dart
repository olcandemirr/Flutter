import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(GunlukMotivasyonApp());
}

class GunlukMotivasyonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Günlük Motivasyon Mesajları',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: MotivasyonMesajlari(),
    );
  }
}

class MotivasyonMesajlari extends StatefulWidget {
  @override
  _MotivasyonMesajlariState createState() => _MotivasyonMesajlariState();
}

class _MotivasyonMesajlariState extends State<MotivasyonMesajlari>
    with SingleTickerProviderStateMixin {
  final List<String> mesajlar = [
    "Başarı sabırla gelir.",
    "Her gün yeni bir fırsattır.",
    "Zorluklar, sizi güçlü yapar.",
    "Hayatta en önemli şey vazgeçmemektir.",
    "Başarı, hazırlığın şansı yakaladığı zamandır.",
    "Kendine inan, her şey mümkündür.",
    "Bugün harika bir gün olacak!",
    "Yarın değil, bugün başla.",
    "Her şey seninle başlar.",
    "Küçük adımlar, büyük değişimler yaratır.",
    "Hayatta hiçbir şey tesadüf değildir.",
    "Güçlü ol, zor zamanlar geçecek.",
    "İmkansız, yalnızca bir kelimedir.",
    "Düşmek başarısızlık değildir, kalkmamak başarısızlıktır.",
    "Zamanını iyi değerlendir, çünkü o geri gelmez.",
    "Her gün bir fırsattır, değerlendir.",
    "Kendini geliştir, çünkü en büyük yatırım sensin.",
    "Başarısızlıklar, başarıya giden yolda taşlardır.",
    "Hayatta ne istiyorsan peşinden git.",
    "Hayal et, inan, başar!",
    "Kendine güven, bu senin yolun.",
    "Başarı, pes etmeyenlerin ödülüdür.",
    "Hayat kısa, anı yaşa.",
    "Geleceği şekillendiren bugündür.",
    "Başarı, emek ister.",
    "Her gün, yeniden başlama fırsatıdır.",
    "İleriye bak, çünkü yönün orası.",
    "Küçük mutluluklar büyük fark yaratır.",
    "Yapabileceğine inanıyorsan, yarı yarıya başardın demektir.",
    "Her şeye rağmen gülümse, hayat buna değer.",
    "Her yeni gün, yeni bir başlangıçtır.",
    "Küçük adımlar büyük farklar yaratır.",
    "Kendi hikayeni yaz, başkalarının değil.",
    "Başarı, cesur olanların yolunda bulunur.",
    "Hayal kurmaktan korkma, gerçekleştirmekten de.",
    "Engeller seni durdurmak için değil, daha güçlü yapmak için vardır.",
    "Her zorluk, saklı bir fırsattır.",
    "Başarıya giden yol, disiplinle döşenmiştir.",
    "Kendi ışığını bul, parlamaktan çekinme.",
    "Bugün, hayallerine bir adım daha yaklaş.",
    "Zor zamanlar seni tanımlar, pes etme.",
    "Gözünü hedefinden ayırma, her şey mümkündür.",
    "Başarı, sabrın ve kararlılığın sonucudur.",
    "Her sabah yeni bir umutla uyan.",
    "Kendin ol, en büyük gücün bu."
  ];

  String _rastgeleMesaj = "Bugün harika bir gün olacak!";

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  void _yeniMesajGetir() {
    setState(() {
      _rastgeleMesaj = mesajlar[Random().nextInt(mesajlar.length)];
    });
    _controller.forward(from: 0.0); // Kart animasyonunu yenile
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Günlük Motivasyon Mesajları'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade700, Colors.indigo.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScaleTransition(
                scale: _animation,
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  shadowColor: Colors.black54,
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      _rastgeleMesaj,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _yeniMesajGetir,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.white70, width: 2),
                  ),
                ),
                child: Text(
                  'Yeni Bir Mesaj Göster',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
