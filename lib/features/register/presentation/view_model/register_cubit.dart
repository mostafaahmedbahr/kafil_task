import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kafil_task/core/utils/app_services/remote_services/api_service.dart';
import 'package:kafil_task/features/register/presentation/view_model/register_states.dart';

import '../../../../core/errors/failure.dart';
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
    required String about,
    required List<int> tags,
    required List<String> socialMedia,
    required String email ,
    required String password,
    required String confirmPassword,
    required int userType,
    required bool gender,
    required dynamic image  ,
    required int salary,
    required String birthDate,
}) async {
    emit(RegisterLoadingState());
    var result = await registerRepo!.register(
        firstName: firstName,
        lastName: lastName,
        tags: tags,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        userType: userType,
        gender: gender,
      image: await MultipartFile.fromFile(
         file!.path,
        filename:  file!.path.split('/').last,
      ),
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


  void register222({
    required String firstName,
    required String lastName,
    required String about,
    required List tags,
    required List favoriteSocialMedia,
    required String salary,
    required String password,
    required String email,
    required var birthDate,
    required int gender,
    required int type,
    required dynamic image  ,
    required String passwordConfirmation,
    context

  }) async {
    emit(RegisterLoadingState());
    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate =  dateOfBirth.text == "" ? "" :outputFormat.format(dateOfBirth as DateTime);
   // ByteData byteData = await rootBundle.load(Assets.images.img.path);
   // List<int> imageData = byteData.buffer.asUint8List();
    FormData formData = FormData.fromMap( image!=null?{
      'avatar': await MultipartFile.fromFile(
          image!.path??"",
          filename: image?.path.split('/').last
      ),
      'first_name': firstName,
      'last_name': lastName,
      'about': about,
      'tags': tags,
      'favorite_social_media': favoriteSocialMedia,
      'salary': salary,
      'password': password,
      'email': email,
      'birth_date':outputDate ,
      'gender': gender,
      'type': type,
      'password_confirmation': passwordConfirmation,
    } : {
      'avatar': MultipartFile.fromBytes(
          image,
          filename: 'image.png'
      ),
      'first_name': firstName,
      'last_name': lastName,
      'about': about,
      'tags[]': tags,
      'favorite_social_media[]': favoriteSocialMedia,
      'salary': salary,
      'password': password,
      'email': email,
      'birth_date': outputDate,
      'gender': gender,
      'type': type,
      'password_confirmation': passwordConfirmation,
    });

    print(birthDate);

    try{
      Response res= await ApiService(Dio()).postData(
          data: formData,
        endPoint:  'user/register',
      );
      if(res.statusCode == 200){
        emit(RegisterSuccessState());
      }else{

      }
    }on DioError catch  (e){
      // final msg= e.response == null?  ServerFailure.fromResponse(e).message??"" :e.response?.data["message"] ;
      // emit(RegisterErrorState(failure.errMessage));
    }
  }

}