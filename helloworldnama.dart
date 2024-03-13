import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController salamController = TextEditingController();
  String? pilihanSalam;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: pilihanSalam,
                items: ['pagi', 'siang'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    pilihanSalam = newValue;
                  });
                },
              ),
              Text("Pilihan : $pilihanSalam"), //tampilkan hasil
              CheckboxListTile(
                title: const Text('Pilihan satu'),
                value: isChecked, //boolean
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                secondary: const Icon(Icons.check_circle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
