import 'package:flutter/material.dart';
import 'package:to_do_app/core/routes/app_routes_name.dart';
import 'package:to_do_app/features/auth/screens/on_boarding_screen/on_boarding_view.dart';

class AppRouter {

  Route ? generateRouter ( RouteSettings settings){

    switch (settings.name) {
      case AppRoutesName.onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      default:
       
    }
    return null;
  }



}