import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
      scaffoldBackgroundColor: AppColor.backgroundColor,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
          color: AppColor.txtColor,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
        displayMedium: GoogleFonts.lato(
          color: AppColor.txtColor,
          fontSize: 16,
        ),
        displaySmall: GoogleFonts.lato(
          color: AppColor.txtColor,
          fontSize: 16,
          fontWeight: FontWeight.normal

        ),
      ));
}
