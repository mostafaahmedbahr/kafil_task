import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/register/presentation/view_model/register_states.dart';

import '../../data/repos/register_repo.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit(this.registerRepo) : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterRepo? registerRepo;


  String? selectedGender;
  final List<String> genders = [
    'male',
    'female',
  ];


}