import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kafil_task/core/errors/failure.dart';
import 'package:kafil_task/features/services/data/models/services_model.dart';
import 'package:kafil_task/features/services/data/repos/services_repo.dart';

import '../../../../core/utils/app_services/remote_services/api_service.dart';
import '../../../../core/utils/app_services/remote_services/endpoints.dart';

class ServicesRepoImpl implements ServicesRepo {
  final ApiService? apiService;

  ServicesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, ServicesModel>> getAllServices() async{
    try {
      var response = await apiService!.get(
        endPoint: EndPoints.servicesUrl,
      );
      var result= ServicesModel.fromJson(response.data);
      return right(result);
    } catch(e)
    {
      if(e is DioException)
      {
        return left(ServerFailure.fromDioError(e));
      }else{
        return left(ServerFailure(e.toString()));
      }

    }
  }


}