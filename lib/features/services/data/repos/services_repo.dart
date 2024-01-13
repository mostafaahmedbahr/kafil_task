import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/popular_services_model.dart';
import '../models/services_model.dart';

abstract class ServicesRepo{
  Future<Either<Failure,ServicesModel>> getAllServices();
  Future<Either<Failure,PopularServicesModel>> getAllPopularServices();
 }