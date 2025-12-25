import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle appbarboldheading = GoogleFonts.rubik(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.appbarheadingcolor,
  );
  static TextStyle appbarheading = GoogleFonts.rubik(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.appbarheadingcolor,
  );
  static TextStyle inputfield = GoogleFonts.rubik(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.textfield,
  );

  static TextStyle title = GoogleFonts.rubik(
    fontSize: 18,
    color: AppColors.tittle,
    fontWeight: FontWeight.w600,
  );

  static TextStyle subtitle = GoogleFonts.rubik(
    fontSize: 12,
    color: AppColors.textfield,
    fontWeight: FontWeight.bold,
  );
}
