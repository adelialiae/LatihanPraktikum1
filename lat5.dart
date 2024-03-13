import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MahasiswaForm(),
    );
  }
}

class MahasiswaForm extends StatefulWidget {
  @override
  _MahasiswaFormState createState() => _MahasiswaFormState();
}

class _MahasiswaFormState extends State<MahasiswaForm> {
  final TextEditingController _namaController = TextEditingController();
  String _gender = 'Laki-laki';
  bool _sudahBekerja = false;
  double _tinggiBadan = 160;
  final List<String> _makananFavorit = [];
  String? _pekerjaanOrtu;
  String? _provinsiAsal;
  final List<String> _provinsiList = ['Jawa Barat', 'Jawa Tengah', 'Jawa Timur', 'Bali', 'Sumatera', 'Kalimantan', 'Sulawesi', 'Papua'];

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _namaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Data Mahasiswa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _namaController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Nama'),
              ),
              const SizedBox(height: 20),
              const Text('Jenis Kelamin'),
              Row(
                children: <Widget>[
                  Radio(
                    value: 'Laki-laki',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  const Text('Laki-laki'),
                  Radio(
                    value: 'Perempuan',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value.toString();
                      });
                    },
                  ),
                  const Text('Perempuan'),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  const Text('Sudah Bekerja'),
                  Switch(
                    value: _sudahBekerja,
                    onChanged: (value) {
                      setState(() {
                        _sudahBekerja = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text('Tinggi Badan: ${_tinggiBadan.toStringAsFixed(0)} cm'),
              Slider(
                value: _tinggiBadan,
                min: 100,
                max: 250,
                divisions: 150,
                onChanged: (value) {
                  setState(() {
                    _tinggiBadan = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text('Makanan Favorit'),
              CheckboxListTile(
                title: const Text('Nasi Goreng'),
                value: _makananFavorit.contains('Nasi Goreng'),
                onChanged: (bool? value) {
                  setState(() {
                    if (value != null && value) {
                      _makananFavorit.add('Nasi Goreng');
                    } else {
                      _makananFavorit.remove('Nasi Goreng');
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Mie Goreng'),
                value: _makananFavorit.contains('Mie Goreng'),
                onChanged: (bool? value) {
                  setState(() {
                    if (value != null && value) {
                      _makananFavorit.add('Mie Goreng');
                    } else {
                      _makananFavorit.remove('Mie Goreng');
                    }
                  });
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _pekerjaanOrtu,
                items: ['PNS', 'Swasta', 'Wiraswasta', 'Petani'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _pekerjaanOrtu = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Pekerjaan Orang Tua'),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _provinsiAsal,
                validator: (value) {
                  if (value == null) {
                    return 'Provinsi tidak boleh kosong';
                  }
                  return null;
                },
                items: _provinsiList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _provinsiAsal = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Provinsi Asal'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Konfirmasi'),
                          content: const Text('Apakah data yang dimasukkan sudah benar?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Tidak'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _showSuccessSnackBar();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil disimpan'),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
