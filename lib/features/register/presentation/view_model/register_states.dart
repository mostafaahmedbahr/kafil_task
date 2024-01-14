abstract class RegisterStates{}

class RegisterInitState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);
}

class AddToListState extends RegisterStates{}
class UploadImageSuccessState extends RegisterStates{}

class ChangeGenderState extends RegisterStates{}
class SelectBirthDateState extends RegisterStates{}