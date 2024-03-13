import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persegi Panjang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PersegiPanjangPage(),
    );
  }
}

class PersegiPanjangPage extends StatefulWidget {
  @override
  _PersegiPanjangPageState createState() => _PersegiPanjangPageState();
}

class _PersegiPanjangPageState extends State<PersegiPanjangPage> {
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();

  double _luas = 0.0;
  double _keliling = 0.0;

  void _hitung() {
    double panjang = double.tryParse(_panjangController.text) ?? 0.0;
    double lebar = double.tryParse(_lebarController.text) ?? 0.0;

    setState(() {
      _luas = panjang * lebar;
      _keliling = 2 * (panjang + lebar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persegi Panjang'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _panjangController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Panjang',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _lebarController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Lebar',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _hitung,
              child: Text('Hitung'),
            ),
            SizedBox(height: 20.0),
            Text('Luas: $_luas'),
            SizedBox(height: 10.0),
            Text('Keliling: $_keliling'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _panjangController.dispose();
    _lebarController.dispose();
    super.dispose();
  }
}
