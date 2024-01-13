import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kafil_task/core/errors/failure.dart';
 import 'package:kafil_task/features/register/data/models/register_model.dart';
import 'package:kafil_task/features/register/data/repos/register_repo.dart';

import '../../../../core/utils/app_services/remote_services/api_service.dart';
import '../../../../core/utils/app_services/remote_services/endpoints.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiService? apiService;

  RegisterRepoImpl(this.apiService);

  @override
  Future<Either<Failure, RegisterModel>> register({
    required String firstName ,
    required String lastName ,
    required String email ,
    required String password,
    required String confirmPassword,
    required int userType,
  }) async {
    try {
      var response = await apiService!.postData(
          endPoint: EndPoints.registerUrl,
          data: {
            "first_name": firstName,
            "last_name": lastName,
            "about": "about",
            "tags": "tags",
            "favorite_social_media": "favorite_social_media",
            "salary": "salary",
            "password": password,
            "email": email,
            "birth_date": "birth_date",
            "gender": "gender",
            "type": "type",
            "avatar": "avatar",
            "password_confirmation": confirmPassword,

          });
      var result=RegisterModel.fromJson(response.data);
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