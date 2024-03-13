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
        title: const Text('Persegi Panjang'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                controller: _panjangController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Panjang',
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextField(
                controller: _lebarController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Lebar',
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _hitung,
              child: const Text('Hitung'),
            ),
            const SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(5.0),
              ),
              padding: const EdgeInsets.all(10.0),
              child: _luas != 0.0
                  ? Text(
                      'Luas: ${_luas.toStringAsFixed(_luas.truncateToDouble() == _luas ? 0 : 2)}',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    )
                  : const SizedBox.shrink(),
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(5.0),
              ),
              padding: const EdgeInsets.all(10.0),
              child: _keliling != 0.0
                  ? Text(
                      'Keliling: ${_keliling.toStringAsFixed(_keliling.truncateToDouble() == _keliling ? 0 : 2)}',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    )
                  : const SizedBox.shrink(),
            ),
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
