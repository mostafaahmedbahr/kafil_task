import 'package:kafil_task/features/who_iam/data/models/who_iam_model.dart';

abstract class ProfileStates{}

class ProfileInitState extends ProfileStates{}

class GetProfileDataLoadingState extends ProfileStates{}
class GetProfileDataSuccessState extends ProfileStates{
  ProfileModel profileModel;
  GetProfileDataSuccessState(this.profileModel);
}
class GetProfileDataErrorState extends ProfileStates{
  final String error;
  GetProfileDataErrorState(this.error);
}