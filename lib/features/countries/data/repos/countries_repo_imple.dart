import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:kafil_task/core/errors/failure.dart';

import 'package:kafil_task/features/countries/data/models/countries_model.dart';

import '../../../../core/utils/app_services/remote_services/api_service.dart';
import '../../../../core/utils/app_services/remote_services/endpoints.dart';
import 'countries_repo.dart';

class CountriesRepoImpl implements CountriesRepo {
  final ApiService? apiService;

  CountriesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, CountriesModel>> getAllCountries() async{
    try {
      var response = await apiService!.get(
        endPoint: EndPoints.countriesUrl,
      );
      var result= CountriesModel.fromJson(response.data);
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