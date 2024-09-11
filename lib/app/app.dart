import 'package:flutter/material.dart';

import 'package:to_do_app/core/routes/routes.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/core/utils/app_strings.dart';
import 'package:to_do_app/features/auth/screens/splash_screen/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
  });
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(),
      onGenerateRoute: appRouter.generateRouter,
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body:  SplashView()),
    );
  }
}
