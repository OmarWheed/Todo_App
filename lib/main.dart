import 'package:flutter/material.dart';
import 'package:to_do_app/app/app.dart';
import 'package:to_do_app/core/routes/routes.dart';
import 'package:to_do_app/core/shared/cache_helper.dart';
import 'package:to_do_app/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //get_ it
  setup();
  //shared preferences
  sl<CacheHelper>().init();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
