 import 'package:flutter/material.dart';
import 'package:kafil_task/core/utils/app_colors/app_colors.dart';
import 'package:kafil_task/core/utils/app_strings/app_strings.dart';
import 'package:kafil_task/features/layout/presentation/views/widgets/custom_app_bar.dart';
import 'package:kafil_task/features/login/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        title: AppStrings.login,
        isLoginScreen: false,
      ),
      body: LoginViewBody() ,
    ));
  }
}
