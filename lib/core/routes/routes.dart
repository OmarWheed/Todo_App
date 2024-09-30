import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/routes/app_routes_name.dart';
import 'package:to_do_app/features/auth/screens/on_boarding_screen/screens/on_boarding_view.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/features/tasks/presentation/screens/add_page.dart';
import 'package:to_do_app/features/tasks/presentation/screens/home_page.dart';

class AppRouter {
  late TaskCubit taskCubit;

  AppRouter() {
    taskCubit = TaskCubit();
  }

  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case AppRoutesName.homePage:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (BuildContext context) => taskCubit,
                  child: const HomePage(),
                )
            );
      case AppRoutesName.addPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<TaskCubit>.value(
            value: taskCubit,
            child: const AddTask(),
          ),
        );
      default:
    }
    return null;
  }
}
