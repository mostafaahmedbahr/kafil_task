import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/countries/data/repos/countries_repo.dart';

import 'countries_states.dart';

class CountriesCubit extends Cubit<CountriesStates> {
  CountriesCubit(this.countriesRepo) : super(CountriesInitState());

  static CountriesCubit get(context) => BlocProvider.of(context);
  CountriesRepo? countriesRepo;

  Future<void> getAllCountriesData() async {
    emit(GetAllCountriesLoadingState());
    var result = await countriesRepo!.getAllCountries();
    return result.fold((failure) {
      emit(GetAllCountriesErrorState(failure.errMessage));
      print(failure.errMessage);
    }, (data) {
      emit(GetAllCountriesSuccessState(data));
    });
  }

}