abstract class LoginStates{}

class LoginInitState extends LoginStates{}

class ChangeSuffixIconState extends LoginStates{}
class ChangeSuffixIconState2 extends LoginStates{}

class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{}
class LoginErrorState extends LoginStates{
  final String errMessage;
  LoginErrorState(this.errMessage);
}