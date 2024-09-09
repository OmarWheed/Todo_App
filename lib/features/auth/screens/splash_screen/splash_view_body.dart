import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/extension/gap.dart';
import 'package:to_do_app/core/routes/app_routes_name.dart';
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_colors.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.pushNamed(context,AppRoutesName.onBoarding);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Image.asset(AppAssets.appLogo),
          //Gap
          19.height,
          //App Name
          Text(
            AppStrings.appName,
            style: GoogleFonts.lato(
              color: AppColor.txtColor,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          
        ],
      ),
    );
  }
}
