import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/countries_model.dart';

abstract class CountriesRepo{
  Future<Either<Failure,CountriesModel>> getAllCountries();

}