import 'package:flutter/material.dart';
import 'package:to_do_app/features/auth/screens/splash_screen/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
