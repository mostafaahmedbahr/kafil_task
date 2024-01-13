import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_services/local_services/cache_helper.dart';
import '../../data/repos/login_repo.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.loginRepo) : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginRepo? loginRepo;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    var result = await loginRepo!.login(email : email , password: password);
    return result.fold((failure) {
      print("error mostafa");
      emit(LoginErrorState(failure.errMessage));
      print(failure.errMessage);
    }, (data) {
      print(data.data!.email);
      print("mostafa login");
      CacheHelper.saveData(key: "firstName", value: data.data!.firstName);
      CacheHelper.saveData(key: "lastName", value: data.data!.lastName);
      CacheHelper.saveData(key: "id", value: data.data!.id);
      CacheHelper.saveData(key: "email", value: data.data!.email);
      CacheHelper.saveData(key: "about", value: data.data!.about);
      CacheHelper.saveData(key: "accessToken", value: data.accessToken);
      emit(LoginSuccessState());
    });
  }

  bool isVisible = true;
  void changeSuffixIcon()
  {
    isVisible =! isVisible;
    emit(ChangeSuffixIconState());
  }

}