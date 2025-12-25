import 'package:doctorapp/constants/app_textstyle.dart';
import 'package:doctorapp/models/doctor_model.dart';
import 'package:flutter/material.dart';

class Primarybutton extends StatelessWidget {
  final Doctor? doctor;
  final VoidCallback onpressfunction;
  const Primarybutton({super.key, this.doctor, required this.onpressfunction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 40,
      child: ElevatedButton(
        onPressed: onpressfunction,
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF22C55E)),
        child: Center(
          child: Text('Book now', style: AppTextStyles.appbarboldheading),
        ),
      ),
    );
  }
}
