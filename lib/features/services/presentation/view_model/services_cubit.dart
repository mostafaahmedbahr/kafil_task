import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/services/presentation/view_model/services_states.dart';

import '../../data/repos/services_repo.dart';


class ServicesCubit extends Cubit<ServicesStates> {
  ServicesCubit(this.servicesRepo) : super(ServicesInitState());

  static ServicesCubit get(context) => BlocProvider.of(context);

  ServicesRepo? servicesRepo;


  Future<void> getAllServicesData() async {
    emit(GetAllServicesDataLoadingState());
    var result = await servicesRepo!.getAllServices();
    return result.fold((failure) {
      emit(GetAllServicesDataErrorState(failure.errMessage));
      print(failure.errMessage);
    }, (data) {
      emit(GetAllServicesDataSuccessState(data));
    });
  }
}