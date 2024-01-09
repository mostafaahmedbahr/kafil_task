 import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/app_services/remote_services/api_service.dart';
import 'layout_repo.dart';


class LayoutRepoImpl implements LayoutRepo{
  final ApiService? apiService;

  LayoutRepoImpl(this.apiService);

  @override
  int changePageIndex({required int pageIndex}) {
   int  newPageIndex = pageIndex;
     return newPageIndex;
  }





  // @override
  // Future<Either<Failure, UserModel>> loginUser({required String code}) async{
  //   try {
  //     var response = await apiService!.postData(endPoint: EndPoints.userLogin,data: {
  //       "code": code,
  //       "device_token": "${CacheKeysManger.getUserDeviceTokenFromCache()}",
  //     });
  //     var result=UserModel.fromJson(response.data);
  //     return right(result);
  //   } catch(e)
  //   {
  //     if(e is DioException)
  //     {
  //       print(e);
  //       return left(ServerFailure.fromDioError(e));
  //     }else{
  //       print(e);
  //       return left(ServerFailure(e.toString()));
  //     }
  //
  //   }
  // }
}