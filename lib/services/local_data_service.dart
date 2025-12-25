import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:doctorapp/models/doctor_model.dart';

class LocalDataService {
  Future<List<Doctor>> getdoctor() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/doctors.json',
      );

      final List<dynamic> data = jsonDecode(response);

      return data.map((e) => Doctor.fromJson(e)).toList();
    } catch (e) {
      debugPrint('Error loading doctors: $e');
      return [];
    }
  }
}
