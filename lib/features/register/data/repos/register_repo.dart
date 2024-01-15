import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
 import '../models/register_model.dart';

abstract class RegisterRepo{
  Future<Either<Failure,RegisterModel>> register({
    required String firstName ,
    required String lastName ,
    required String about,
    required List<int> tags,
    required List socialMedia,
    required String email ,
    required String password,
    required String confirmPassword,
    required int userType,
    required bool gender,
    required dynamic image  ,
    required int salary,
    required String birthDate,

  });

}