
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafil_task/core/shared_widgets/custom_button.dart';
import 'package:kafil_task/core/shared_widgets/custom_loading.dart';
import 'package:kafil_task/core/shared_widgets/custom_text_form_filed.dart';
import 'package:kafil_task/core/utils/app_colors/app_colors.dart';
import 'package:kafil_task/core/utils/app_nav/app_nav.dart';
import 'package:kafil_task/core/utils/app_strings/app_strings.dart';
import 'package:kafil_task/core/utils/app_styles/app_styles.dart';
import 'package:kafil_task/features/layout/presentation/views/layout_view.dart';
import 'package:kafil_task/features/login/presentation/view_model/login_cubit.dart';
import 'package:kafil_task/features/login/presentation/view_model/login_states.dart';
import 'package:kafil_task/features/register/presentation/views/register_view.dart';

import '../../../../../core/utils/new_toast/new_toast.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool checkBoxValue = false;
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit , LoginStates>(
      listener: (context , state){
        if(state is LoginSuccessState){
          NewToast.showNewSuccessToast(
              msg: "Successfully login",
              context: context,
          );
          AppNav.customNavigator(
              context: context,
              screen: const LayoutView(),
              finish: true,
          );
        }
        else if(state is LoginErrorState){
          NewToast.showNewSuccessToast(
            msg: "Error in login",
            context: context,
          );
        }

      },
      builder: (context , state){
        var loginCubit = LoginCubit.get(context);
        return Form(
          key: _formKey,
          child: Column(
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
                    CustomTextFormField(
                      controller: emailCon,
                      validator: (String? value) {
    if (value!.isEmpty) {
    return "please enter your email !!";
    } }
                    ),
                    const SizedBox(height: 16,),
                    const Text(AppStrings.password),
                    const SizedBox(height: 8,),
                    CustomTextFormField(
                      obscureText: loginCubit.isVisible,
                        icon: InkWell(
                            onTap: (){
                              loginCubit.changeSuffixIcon;
                            },
                            child: const Icon(Icons.visibility_off)),
                        controller: passwordCon,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "please enter your password !!";
                          } }
                    ),
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
                    ConditionalBuilder(
                      condition: state is ! LoginLoadingState,
                      fallback: (context){
                        return const CustomLoading();
                      },
                      builder: (context){
                        return CustomButton(
                          width: double.infinity,
                          btnText: const Text(AppStrings.login,
                            style: AppStyles.textStyle15White500,),
                          onPressed: (){
                            emailCon.text = "samer@gmail.com";
                            passwordCon.text = "123123123";
    if (_formKey.currentState!.validate()) {
      loginCubit.login(
        email: emailCon.text,
        password: passwordCon.text,
      );
    }

                          },
                        );
                      },
                    ),
                    const SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an account ? "),
                        InkWell(
                          onTap: (){
                            AppNav.customNavigator(context: context,
                                screen: const RegisterView(),
                                finish: false);
                          },
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
          ),
        );
      },

    );
  }
}
