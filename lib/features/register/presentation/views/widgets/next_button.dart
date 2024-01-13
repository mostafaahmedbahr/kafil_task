import 'package:flutter/material.dart';
import 'package:kafil_task/core/shared_widgets/custom_button.dart';
import 'package:kafil_task/core/utils/app_nav/app_nav.dart';
import 'package:kafil_task/core/utils/app_strings/app_strings.dart';
import 'package:kafil_task/core/utils/app_styles/app_styles.dart';
import 'package:kafil_task/features/register/presentation/views/widgets/register_view_body_2.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: 160,
        btnText: const Text(AppStrings.next,
        style: AppStyles.textStyle15White500,),
        onPressed: (){
        AppNav.customNavigator(context: context, screen: RegisterViewBody2(), finish: false);
        },
    );
  }
}
