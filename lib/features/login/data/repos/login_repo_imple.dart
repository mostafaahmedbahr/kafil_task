import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kafil_task/core/errors/failure.dart';
import 'package:kafil_task/features/login/data/repos/login_repo.dart';

import '../../../../core/utils/app_services/remote_services/api_service.dart';
import '../../../../core/utils/app_services/remote_services/endpoints.dart';
import '../models/login_model.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService? apiService;

  LoginRepoImpl(this.apiService);

  @override
  Future<Either<Failure, LoginModel>> login({
    required String email,
    required String password}) async {
    try {
      var response = await apiService!.postData(
          endPoint: EndPoints.loginUrl,
          data: {
        "email": email,
        "password": password,

      });
      var result=LoginModel.fromJson(response.data);
      return right(result);
    } catch(e)
    {
      if(e is DioException)
      {
        print(e);
        return left(ServerFailure.fromDioError(e));
      }else{
        print(e);
        return left(ServerFailure(e.toString()));
      }

    }
  }


}