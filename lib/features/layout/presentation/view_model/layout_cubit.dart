


 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/services/presentation/views/services_view.dart';


import '../../../../core/utils/app_strings/app_strings.dart';
import '../../../countries/presentation/views/countries_view.dart';
import '../../../who_iam/presentation/views/widgets/profile_view_body.dart';
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




    List screens = const [

      ProfileViewBody(),
      CountriesView(),
      ServicesView(),
    ];


    List<String> ourCategoriesListItemsNames = [
      AppStrings.whoAmI,
      AppStrings.countries,
      AppStrings.services,
    ];


}