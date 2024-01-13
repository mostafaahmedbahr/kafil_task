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