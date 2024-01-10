 import 'package:flutter/material.dart';
import 'package:kafil_task/core/utils/app_colors/app_colors.dart';
import 'package:kafil_task/core/utils/app_strings/app_strings.dart';
import 'package:kafil_task/features/layout/presentation/views/widgets/custom_app_bar.dart';
import 'package:kafil_task/features/register/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        title: AppStrings.register,
        isLoginScreen: true,
      ),
          body: RegisterViewBody(),
    ));
  }
}
