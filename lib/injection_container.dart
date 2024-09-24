import 'package:get_it/get_it.dart';
import 'package:government_project/layers/bloc/decision_bloc/decision_cubit.dart';
import 'package:government_project/layers/bloc/events_bloc/events_cubit.dart';
import 'package:government_project/layers/bloc/news_bloc/news_cubit.dart';
import 'package:government_project/layers/bloc/services_bloc/services_cubit.dart';

import 'core/dio/factory.dart';

final sl = GetIt.instance;

void initInjection() {
  sl.registerLazySingleton(() => DioFactory.create());

  //cubit
  sl.registerLazySingleton(() => DecisionCubit());
  sl.registerLazySingleton(() => EventsCubit());
  sl.registerLazySingleton(() => NewsCubit());
  sl.registerLazySingleton(() => ServicesCubit());

  //Provider

  //data_provider

  //repos
}
