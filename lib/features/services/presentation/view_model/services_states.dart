import '../../data/models/popular_services_model.dart';
import '../../data/models/services_model.dart';

abstract class ServicesStates{}

class ServicesInitState extends ServicesStates{}

class GetAllServicesDataLoadingState extends ServicesStates{}
class GetAllServicesDataErrorState extends ServicesStates{
  final String error;
  GetAllServicesDataErrorState(this.error);
}
class GetAllServicesDataSuccessState extends ServicesStates{
  ServicesModel servicesModel;
  GetAllServicesDataSuccessState(this.servicesModel);
}


class GetAllPopularServicesDataLoadingState extends ServicesStates{}
class GetAllPopularServicesDataErrorState extends ServicesStates{
  final String error;
  GetAllPopularServicesDataErrorState(this.error);
}
class GetAllPopularServicesDataSuccessState extends ServicesStates{
  PopularServicesModel popularServicesModel;
  GetAllPopularServicesDataSuccessState(this.popularServicesModel);
}