import 'package:flutter/material.dart';
import 'package:to_do_app/core/routes/app_routes_name.dart';
import 'package:to_do_app/features/auth/screens/on_boarding_screen/screens/on_boarding_view.dart';
import 'package:to_do_app/features/tasks/screens/add_page.dart';
import 'package:to_do_app/features/tasks/screens/home_page.dart';

class AppRouter {
  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case AppRoutesName.homePage:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case AppRoutesName.addPage:
        return MaterialPageRoute(builder: (context) => const AddTask());
      default:
    }
    return null;
  }
}
