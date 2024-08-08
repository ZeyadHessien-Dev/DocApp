import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_project/features/login/data/api/login_api.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/data/repo/login_repo.dart';
import '../../features/login/logic/login_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  Dio dio = DioFactory.getDio();

  // login
  getIt.registerLazySingleton<LoginApi>(() => LoginApi(dio));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
