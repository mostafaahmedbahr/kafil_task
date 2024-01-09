


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/utils/app_strings/app_strings.dart';
import '../../data/repos/layout_repo.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
    LayoutCubit(this.layoutRepo) : super(LayoutInitState());
    static LayoutCubit get(context) => BlocProvider.of(context);
  LayoutRepo? layoutRepo;

    static  int newPageIndex = 0;

  changePageIndexInCubit({required int pageIndex})
  {
      newPageIndex = layoutRepo!.changePageIndex(pageIndex: pageIndex);
    pageIndex = newPageIndex;
    emit(ChangePageIndexInCubitState());
  }




    List screens = [
      // const Home(),
      // const Services(),
      // const Fav(),
      Text("4"),
      Text("5"),
      Text("6"),
    ];


    List<String> ourCategoriesListItemsNames = [
      AppStrings.whoAmI,
      AppStrings.countries,
      AppStrings.services,
    ];

  // Future<void> loginUser({required String code}) async {
  //   emit(UserLayoutLoadingState());
  //   var result = await authRepo!.loginUser(code: code);
  //   return result.fold((failure) {
  //     print("error mostafa");
  //     emit(UserLayoutErrorState(failure.errMessage));
  //     print(failure.errMessage);
  //   }, (data) {
  //     CacheHelper.saveData(key: "name", value: data.data!.name);
  //     CacheHelper.saveData(key: "image", value: data.data!.image);
  //     CacheHelper.saveData(key: "role", value: data.data!.role);
  //     CacheHelper.saveData(key: "QR", value: data.data!.qr);
  //     CacheHelper.saveData(key: "bio", value: data.data!.iCan);
  //     CacheHelper.saveData(key: "code", value: data.data!.code);
  //     CacheHelper.saveData(key: "id", value: data.data!.id);
  //     emit(UserLayoutSuccessState());
  //   });
  // }
}