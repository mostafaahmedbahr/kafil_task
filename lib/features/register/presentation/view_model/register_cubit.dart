import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
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

  List<String> socialMediaList = [];

  bool faceBook = false;
  bool twitter = false;
  bool linkedIn = false;
  addToList(isAddVal)
  {


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


}