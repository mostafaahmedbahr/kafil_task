import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kafil_task/core/errors/failure.dart';
 import 'package:kafil_task/features/who_iam/data/repos/who_iam_repo.dart';

import '../../../../core/utils/app_services/remote_services/api_service.dart';
import '../../../../core/utils/app_services/remote_services/endpoints.dart';
import '../models/who_iam_model.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService? apiService;

  ProfileRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ProfileModel>> getProfileData() async {
    try {
      var response = await apiService!.get(
          endPoint: EndPoints.profileUrl,
          );
      var result = ProfileModel.fromJson(response.data);
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