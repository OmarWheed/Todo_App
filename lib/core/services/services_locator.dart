//inti get it
import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/shared/cache_helper.dart';

final GetIt sl = GetIt.instance;

Future<void> setup() async{
  sl.registerLazySingleton<CacheHelper>(() => CacheHelper());
  // sl.registerLazySingleton<TaskCubit>(() => TaskCubit());
}
