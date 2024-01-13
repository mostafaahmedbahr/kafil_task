import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
 import '../models/who_iam_model.dart';

abstract class ProfileRepo{
  Future<Either<Failure,ProfileModel>> getProfileData();

}