import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textController = TextEditingController();
  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Kod Oluşturucu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'QR kod içeriği',
              ),
              onChanged: (value) {
                setState(() {
                  qrData = value;
                });
              },
            ),
            SizedBox(height: 20),
            if (qrData != null && qrData!.isNotEmpty)
              QrImage(
                data: qrData!,
                size: 200.0,
              ),
          ],
        ),
      ),
    );
  }
}
