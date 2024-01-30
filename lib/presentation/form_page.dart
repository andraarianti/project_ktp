import 'package:flutter/material.dart';
import 'package:project_ktp/data/repository/ktp_repository.dart';
import 'package:project_ktp/domain/entities/provinsi.dart';
class FormPage extends StatefulWidget {
  // late final GetProvinsiUseCase getProvinsiUseCase;
  // FormPage({required this.getProvinsiUseCase});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final KtpRepository ktpRepository = KtpRepository();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _ttlController = TextEditingController();
  TextEditingController _pekerjaanController = TextEditingController();
  TextEditingController _pendidikanController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<Provinsi>? provinsiItems;

  @override
  void initState() {
    super.initState();
    _loadProvinsi();
  }

  Future<void> _loadProvinsi() async {
    try {
      List<Provinsi> data = await ktpRepository.getProvinsi();
      setState(() {
        provinsiItems = data;
      });
    } catch (error) {
      // Handle error
      print('Error loading dropdown data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Form Page'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _namaController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nama',
                          hintText: 'Masukan Nama Anda',
                        ),
                        validator: (String? value) {
                          if (value!.length == 0) {
                            return 'Nama wajib di isi';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _ttlController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Tempat Tanggal Lahir',
                          hintText: 'Masukan Tempat Tanggal Lahir',
                        ),
                        validator: (String? value) {
                          if (value!.length == 0) {
                            return 'TTL wajib di isi';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      if (provinsiItems != null)
                        DropdownButtonFormField<Provinsi>(
                          items: provinsiItems!
                              .map((provinsi) => DropdownMenuItem<Provinsi>(
                            value: provinsi,
                            child: Text(provinsi.name ?? ''),
                          ))
                              .toList(),
                          onChanged: (Provinsi? newValue) {
                            // Handle the selected provinsi
                          },
                          decoration: InputDecoration(
                            labelText: 'Provinsi',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _pekerjaanController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Pekerjaan',
                          hintText: 'Masukan Pekerjaan Anda',
                        ),
                        validator: (String? value) {
                          if (value!.length == 0) {
                            return 'Pekerjaan wajib di isi';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _pendidikanController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Pendidikan',
                          hintText: 'Masukan Pendidikan Anda',
                        ),
                        validator: (String? value) {
                          if (value!.length == 0) {
                            return 'Pendidikan wajib di isi';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
