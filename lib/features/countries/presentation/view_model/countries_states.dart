import 'package:kafil_task/features/countries/data/models/countries_model.dart';

abstract class CountriesStates{}

class CountriesInitState extends CountriesStates{}

class GetAllCountriesLoadingState extends CountriesStates{}
class GetAllCountriesSuccessState extends CountriesStates{
  CountriesModel countriesModel;
  GetAllCountriesSuccessState(this.countriesModel);
}
class GetAllCountriesErrorState extends CountriesStates{
  final String error;
  GetAllCountriesErrorState(this.error);
}