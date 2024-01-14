import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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

  changeGender(value)
  {
    selectedGender = value  ;
    emit(ChangeGenderState());
  }

  List<String> socialMediaList = [];

  bool faceBook = false;
  bool twitter = false;
  bool linkedIn = false;
  addToList(socialMedia)
  {
    if (!socialMediaList.contains(socialMedia)) {
      socialMediaList.add(socialMedia);
      print(socialMediaList);
    } else {
      socialMediaList.remove(socialMedia);
      print(socialMediaList);
    }

    emit(AddToListState());
  }



  File? file;
  ///
  Future uploadOnlyImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ["jpg", "png", "jpeg"],
      type: FileType.custom,
    );
    if(result !=null){
      file = File(result.files.single.path ?? "");
    }
    debugPrint("---------- uplod is done ------------");
    emit(UploadImageSuccessState());
  }


  var dateOfBirth = TextEditingController();
  var firstNameCon = TextEditingController();
  var lastNameCon = TextEditingController();
  var emailCon = TextEditingController();
  var passwordCon = TextEditingController();
  var configPasswordCon = TextEditingController();
  var aboutCon = TextEditingController();
  var salaryCon = TextEditingController();


  selectBirthDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
        dateOfBirth.text = DateFormat(
            "yyyy-MM-dd")
            .format(
            pickedDate);
        print(dateOfBirth.text);
        emit(SelectBirthDateState());
    }
    emit(SelectBirthDateState());
  }



  Future<void> register({
    required String firstName ,
    required String lastName ,
    required String email ,
    required String password,
    required String confirmPassword,
    required String userType,
    required dynamic image  ,
    required String about,
    required String salary,
    required String birthDate,
    required List<String> socialMedia,
}) async {
    emit(RegisterLoadingState());
    var result = await registerRepo!.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        userType: userType,
        image: image,
        about: about,
        salary: salary,
        birthDate: birthDate,
        socialMedia: socialMedia,
    );
    return result.fold((failure) {
      print("error mostafa");
      emit(RegisterErrorState(failure.errMessage));
      print(failure.errMessage);
    }, (data) {
      emit(RegisterSuccessState());
    });
  }

}