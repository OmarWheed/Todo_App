import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          theme: getAppTheme(),
          onGenerateRoute: appRouter.generateRouter,
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          home: const Scaffold(body: SplashView()),
        );
      },
    );
  }
}
