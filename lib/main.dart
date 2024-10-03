import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/app/app.dart';
import 'package:to_do_app/app/bloc_observer.dart';
import 'package:to_do_app/core/database/db_helper.dart';
import 'package:to_do_app/core/routes/routes.dart';
import 'package:to_do_app/core/shared/cache_helper.dart';
import 'package:to_do_app/core/services/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //get_ it
  setup();
  //shared preferences
  await sl<CacheHelper>().init();

  //database
  await sl<DataBaseHelper>().initDb();
  Bloc.observer = MyBlocObserver();
  runApp(
    MyApp(
      appRouter: AppRouter(),
    ),
  );
}
