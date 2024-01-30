import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project_ktp/domain/entities/provinsi.dart';

abstract class AbstractKtpRepository {
  Future<List<Provinsi>> getProvinsi();
}

class KtpRepository implements AbstractKtpRepository {
  @override
  Future<List<Provinsi>> getProvinsi() async {
    // Load JSON data from assets
    String data = await rootBundle.loadString('assets/provinces.json');
    List<dynamic> jsonList = json.decode(data);
    print("DATA REPO ${data}");

    // Convert JSON data to Regency objects
    List<Provinsi> provinsiList = jsonList.map((json) {
      return Provinsi(
        id: json['id'],
        name: json['name'],
        altName: json['alt_name'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );
    }).toList();

    return provinsiList;
  }
}
