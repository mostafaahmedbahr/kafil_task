

 import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/register/presentation/view_model/register_cubit.dart';
import 'package:kafil_task/features/register/presentation/view_model/register_states.dart';
import 'package:kafil_task/features/register/presentation/views/widgets/next_button.dart';
 import 'package:kafil_task/features/register/presentation/views/widgets/register_stepper_widget.dart';

import '../../../../../core/shared_widgets/custom_text_form_filed.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_services/remote_services/service_locator.dart';
import '../../../../login/presentation/view_model/login_cubit.dart';
import '../../../data/repos/register_repo_imple.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  @override
  Widget build(BuildContext context) {
    var firstNameCon = TextEditingController();
    var lastNameCon = TextEditingController();
    var emailCon = TextEditingController();
    var passwordCon = TextEditingController();
    var configPasswordCon = TextEditingController();

    return   BlocProvider(
        create: (context) => RegisterCubit(getIt.get<RegisterRepoImpl>()),

      child: BlocConsumer<RegisterCubit , RegisterStates>(
        listener: (context , state){},
        builder: (context , state ){
          var cubit = RegisterCubit.get(context);
          return  Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RegisterStepperWidget(),
                const SizedBox(height: 32,),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("First Name",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(105, 111, 121, 1)
                            ),),
                          const SizedBox(height: 8,),
                          CustomTextFormField(
                              hintColor:   const Color.fromRGBO(51, 51, 51, 1),
                              controller: firstNameCon,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "please enter your first name !!";
                                } }
                          ),
                        ],

                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Last Name",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(105, 111, 121, 1)
                            ),),
                          const SizedBox(height: 8,),
                          CustomTextFormField(
                              hintColor:   const Color.fromRGBO(51, 51, 51, 1),
                              controller: lastNameCon,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return "please enter your lasr name !!";
                                } }
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 16,),
                const Text("Email Address",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(105, 111, 121, 1)
                  ),),
                const SizedBox(height: 8,),
                CustomTextFormField(
                    hintColor:   const Color.fromRGBO(51, 51, 51, 1),
                    controller: emailCon,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "please enter your email !!";
                      } }
                ),
                const SizedBox(height: 16,),

                const Text("Password",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(105, 111, 121, 1)
                  ),),
                const SizedBox(height: 8,),
                CustomTextFormField(
                    obscureText: LoginCubit.get(context).isVisible,
                    icon: InkWell(
                        onTap: (){
                          LoginCubit.get(context).changeSuffixIcon;
                        },
                        child: const Icon(Icons.visibility_off)),
                    hintColor:   const Color.fromRGBO(51, 51, 51, 1),
                    controller: passwordCon,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "please enter your password !!";
                      } }
                ),
                const SizedBox(height: 16,),

                const Text("Confirm Password",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(105, 111, 121, 1)
                  ),),
                const SizedBox(height: 8,),
                CustomTextFormField(
                    obscureText: LoginCubit.get(context).isVisible2,
                    icon: InkWell(
                        onTap: (){
                          LoginCubit.get(context).changeSuffixIcon2;
                        },
                        child: const Icon(Icons.visibility_off)),
                    hintColor:   const Color.fromRGBO(51, 51, 51, 1),
                    controller: configPasswordCon,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "please enter your confirm password !!";
                      } }
                ),
                const SizedBox(height: 16,),



                DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: const Text("User Type"),
                    items: cubit.genders
                        .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.blackColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: cubit.selectedGender,
                    onChanged: (value) {
                      setState(() {
                        cubit.selectedGender = value as String;
                        print(cubit.selectedGender);
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 56,
                      padding:
                      const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: AppColors.greyColor,
                        ),
                        color: AppColors.whiteColor,
                      ),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                      ),
                      iconSize: 20,
                      iconEnabledColor: AppColors.greyColor,
                      iconDisabledColor: AppColors.greyColor,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: null,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColors.mainColor,
                      ),
                      elevation: 8,
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness:
                        MaterialStateProperty.all<double>(6),
                        thumbVisibility:
                        MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                const Align(
                    alignment: Alignment.topRight,
                    child: NextButton()),
              ],
            ),
          );
        },
      ),
    );
  }
}
