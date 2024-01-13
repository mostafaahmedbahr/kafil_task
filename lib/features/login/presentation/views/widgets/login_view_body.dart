import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafil_task/core/shared_widgets/custom_button.dart';
import 'package:kafil_task/core/shared_widgets/custom_text_form_filed.dart';
import 'package:kafil_task/core/utils/app_colors/app_colors.dart';
import 'package:kafil_task/core/utils/app_strings/app_strings.dart';
import 'package:kafil_task/core/utils/app_styles/app_styles.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const SizedBox(height: 50,),
        Center(child: SvgPicture.asset("assets/images/svgs/Login-cuate 1.svg")),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(AppStrings.emailAddress),
              const SizedBox(height: 8,),
              CustomTextFormField(),
              const SizedBox(height: 16,),
              const Text(AppStrings.password),
              const SizedBox(height: 8,),
              CustomTextFormField(),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                          value: checkBoxValue,
                          checkColor: AppColors.whiteColor,
                          activeColor: AppColors.mainColor,
                          onChanged: (bool? newValue){
                            setState(() {
                              checkBoxValue = newValue!;
                            });
                          },
                      ),
                      const Text("Remember me"),
                    ],
                  ),
                  const Text("Forgot Password?"),
                ],
              ),
              const SizedBox(height: 32,),
              CustomButton(
                width: double.infinity,
                  btnText: const Text(AppStrings.login,
                  style: AppStyles.textStyle15White500,),
                  onPressed: (){},
              ),
              const SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account ? "),
                  InkWell(
                    onTap: (){},
                    child: const Text(AppStrings.register,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),),
                  ),
                ],
              ),
            ],
          ),
        )

      ],
    );
  }
}
