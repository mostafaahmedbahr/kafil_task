import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/services_model.dart';

abstract class ServicesRepo{
  Future<Either<Failure,ServicesModel>> getAllServices();
 }