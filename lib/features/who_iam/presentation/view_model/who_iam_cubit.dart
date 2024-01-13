import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/who_iam/data/repos/who_iam_repo.dart';
import 'package:kafil_task/features/who_iam/presentation/view_model/who_iam_states.dart';
import '../../../../core/utils/app_services/local_services/cache_helper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this.profileRepo) : super(ProfileInitState());

  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileRepo? profileRepo;

  Future<void> getProfileData() async {
    emit(GetProfileDataLoadingState());
    var result = await profileRepo!.getProfileData();
    return result.fold((failure) {
      print("error mostafa");
      emit(GetProfileDataErrorState(failure.errMessage));
      print(failure.errMessage);
    }, (data) {
      print(data.data!.email);
      print("mostafa profile");
      emit(GetProfileDataSuccessState(data));
    });
  }



}