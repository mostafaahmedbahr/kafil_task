
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_images/app_images.dart';
import '../../view_model/layout_cubit.dart';
import '../../view_model/layout_states.dart';

//ignore: must_be_immutable
class CustomBottomNavigationBar extends StatelessWidget {
    const CustomBottomNavigationBar({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit , LayoutStates>(
      builder: (context , state){
        var layoutCubit = LayoutCubit.get(context);
        return BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: AppColors.greyColor,
          unselectedIconTheme: const IconThemeData(
            color: AppColors.greyColor
          ),
          selectedIconTheme: const IconThemeData(
              color: AppColors.mainColor
          ),
          type: BottomNavigationBarType.fixed,
          currentIndex:  LayoutCubit.newPageIndex,
          onTap: (index){
            layoutCubit.changePageIndexInCubit(pageIndex: index);
          },
          items:   [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AppImages. ,
              color: LayoutCubit.newPageIndex == 0 ? AppColors.mainColor : AppColors.greyColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:  SvgPicture.asset(AppImages.servicesIcon,
                color: LayoutCubit.newPageIndex == 1 ? AppColors.mainColor : AppColors.greyColor,),
              label: 'Services',
            ),
            BottomNavigationBarItem(
              icon:  SvgPicture.asset(AppImages.favIcon,
                color: LayoutCubit.newPageIndex == 2 ? AppColors.mainColor : AppColors.greyColor,
              ),
              label: 'Favorite',
            ),
              BottomNavigationBarItem(
              icon: Icon(Icons.person ,
                color: LayoutCubit.newPageIndex == 3 ? AppColors.mainColor : AppColors.greyColor,
              ),
              label: 'Account',
            ),
          ],
        );
      },

    );
  }
}
