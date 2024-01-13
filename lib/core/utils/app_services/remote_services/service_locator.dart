import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kafil_task/features/services/data/repos/services_repo_imple.dart';
import '../../../../features/countries/data/repos/countries_repo_imple.dart';
import '../../../../features/layout/data/repos/layout_repo_implementation.dart';
import '../../../../features/login/data/repos/login_repo_imple.dart';
import 'api_service.dart';
//dependency Injection

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LayoutRepoImpl>(LayoutRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(
    getIt.get<ApiService>(),
  ));

  getIt.registerSingleton<ServicesRepoImpl>(ServicesRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<CountriesRepoImpl>(CountriesRepoImpl(
    getIt.get<ApiService>(),
  ));


}