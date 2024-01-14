import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
 import '../models/register_model.dart';

abstract class RegisterRepo{
  Future<Either<Failure,RegisterModel>> register({
    required String firstName ,
    required String lastName ,
    required String email ,
    required String password,
    required String confirmPassword,
    required String userType,
    required String image  ,
    required String about,
    required String salary,
    required String birthDate,
    required List socialMedia,

  });

}