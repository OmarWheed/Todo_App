import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utils/app_colors.dart';

ThemeData getAppTheme() {
  return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.backgroundColor,
        foregroundColor: AppColor.txtColor,
      ),
      primaryColorLight: AppColor.txtColor,
      scaffoldBackgroundColor: AppColor.backgroundColor,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.lato(
          color: AppColor.txtColor,
          fontWeight: FontWeight.bold,
          fontSize: 32.sp,
        ),
        displayMedium: GoogleFonts.lato(
          color: AppColor.txtColor,
          fontSize: 16.sp,
        ),
        displaySmall: GoogleFonts.lato(
            color: AppColor.txtColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ));
}
