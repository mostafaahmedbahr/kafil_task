import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafil_task/core/shared_widgets/custom_button.dart';

import '../../../../../core/shared_widgets/custom_sized_box.dart';
import '../../../../../core/shared_widgets/custom_text_form_filed.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/app_services/remote_services/service_locator.dart';
import '../../../../../core/utils/app_strings/app_strings.dart';
import '../../../../../core/utils/app_styles/app_styles.dart';
import '../../../data/repos/register_repo_imple.dart';
import '../../view_model/register_cubit.dart';
import '../../view_model/register_states.dart';

class RegisterViewBody2 extends StatefulWidget {
  const RegisterViewBody2({super.key});

  @override
  State<RegisterViewBody2> createState() => _RegisterViewBody2State();
}

class _RegisterViewBody2State extends State<RegisterViewBody2> {
  @override
  Widget build(BuildContext context) {
    var aboutCon = TextEditingController();
    var salaryCon = TextEditingController();
    var emailCon = TextEditingController();
    return BlocProvider(
      create: (context) => RegisterCubit(getIt.get<RegisterRepoImpl>()),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Text(AppStrings.register,
                                  style: AppStyles.textStyle12Green600,),
                              ),
                              Text(AppStrings.completeData,
                                style: AppStyles.textStyle12Green600,),
                            ],
                          ),
                          const CustomSizedBox(height: 12,),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 2,
                                  color: AppColors.mainColor,
                                ),
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.whiteColor,
                                  border: Border.all(
                                      color: AppColors.mainColor
                                  ),
                                ),
                                child: const Center(
                                  child: Text("1",
                                    style: AppStyles.textStyle12Green600,),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 2,
                                  color: AppColors.mainColor,
                                ),
                              ),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.whiteColor,
                                  border: Border.all(
                                    color:  AppColors.mainColor,
                                  ),
                                ),
                                child: const Center(
                                  child: Text("2",
                                    style: AppStyles.textStyle12Green600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 2,
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 32,),
                            Stack(
                              children: [
                                Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                                    height: 83,
                                    width: 83,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child:
                                      // RegisterCubit.get(context).file != null ?
                                      // Image.file(
                                      //   RegisterCubit.get(context).file!,
                                      //   fit: BoxFit.cover,
                                      //   height: 83,
                                      //   width: 83,
                                      // ) :
                                      Image.asset("assets/images/pngs/Group 1000001077.png"),
                                    )),
                                InkWell(
                                  onTap:
                                      () {
                                    RegisterCubit.get(context).uploadOnlyImage();
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(border: Border.all(color: AppColors.mainColor), borderRadius: BorderRadius.circular(50)),
                                      height: 83,
                                      width: 83,
                                      child: const Icon(
                                        size: 30,
                                        Icons.add,
                                        color:
                                        AppColors.mainColor,
                                      )),
                                )
                              ],
                            ),
                      const SizedBox(height: 16,),



                      const Text("About",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(105, 111, 121, 1)
                        ),),
                      const SizedBox(height: 8,),
                      CustomTextFormField(
                        maxLines: 5,
                          hintColor:   const Color.fromRGBO(51, 51, 51, 1),
                          controller: aboutCon,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "please enter your about !!";
                            } }
                      ),
                      const SizedBox(height: 16,),

                      const Text("Salary",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(105, 111, 121, 1)
                        ),),
                      const SizedBox(height: 8,),
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                          hintColor:   const Color.fromRGBO(51, 51, 51, 1),
                          controller: salaryCon,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "please enter your Salary !!";
                            } }
                      ),
                      const SizedBox(height: 16,),


                      const SizedBox(height: 16,),
                      Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    if (!RegisterCubit.get(context).socialMediaList.contains("facebook")) {
                                      RegisterCubit.get(context).socialMediaList.add("facebook");
                                      print(RegisterCubit.get(context).socialMediaList);
                                    } else {
                                      RegisterCubit.get(context).socialMediaList.remove("facebook");
                                      print(RegisterCubit.get(context).socialMediaList);
                                    }
                                  });
                                },
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.greyColor.withOpacity(.5),
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                    color:
                                    RegisterCubit.get(context).socialMediaList.contains("facebook") ?
                                    AppColors.mainColor :
                                    AppColors.whiteColor,
                                  ),
                                  child: const Icon(Icons.check,
                                    size: 15,
                                    color: AppColors.whiteColor,),
                                ),
                              ),
                              const SizedBox(width: 12,),
                              const Row(
                                children: [
                                  Icon(FontAwesomeIcons.facebook,
                                    color: Colors.blue,),
                                  SizedBox(width: 8,),
                                  Text("Facebook",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    if (!RegisterCubit.get(context).socialMediaList.contains("twitter")) {
                                      RegisterCubit.get(context).socialMediaList.add("twitter");
                                      print(RegisterCubit.get(context).socialMediaList);
                                    } else {
                                      RegisterCubit.get(context).socialMediaList.remove("twitter");
                                      print(RegisterCubit.get(context).socialMediaList);
                                    }
                                  });
                                },
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.greyColor.withOpacity(.5),
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                    color:
                                    RegisterCubit.get(context).socialMediaList.contains("twitter") ?
                                    AppColors.mainColor :
                                    AppColors.whiteColor,
                                  ),
                                  child: const Icon(Icons.check,
                                    size: 15,
                                    color: AppColors.whiteColor,),
                                ),
                              ),
                              const SizedBox(width: 12,),
                              const Row(
                                children: [
                                  Icon(FontAwesomeIcons.squareTwitter,
                                    color: Colors.blue,),
                                  SizedBox(width: 8,),
                                  Text("Twitter",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                setState(() {
                                  if (!RegisterCubit.get(context).socialMediaList.contains("instagram")) {
                                    RegisterCubit.get(context).socialMediaList.add("instagram");
                                    print(RegisterCubit.get(context).socialMediaList);
                                  } else {
                                    RegisterCubit.get(context).socialMediaList.remove("instagram");
                                    print(RegisterCubit.get(context).socialMediaList);
                                  }
                                });
                                },
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.greyColor.withOpacity(.5),
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                    color:
                                    // state.profileModel.data!.favoriteSocialMedia![0]=="linkedIn" ?
                                    RegisterCubit.get(context).socialMediaList.contains("instagram") ?
                                    AppColors.mainColor :
                                    AppColors.whiteColor,
                                  ),
                                  child: const Icon(Icons.check,
                                    size: 15,
                                    color: AppColors.whiteColor,),
                                ),
                              ),
                              const SizedBox(width: 12,),
                              const Row(
                                children: [
                                  Icon(FontAwesomeIcons.linkedin,
                                    color: Colors.blue,),
                                  SizedBox(width: 8,),
                                  Text("LinkedIn",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                     const SizedBox(height: 32,),
                      CustomButton(
                        width: double.infinity,
                        btnText: const Text("Submit",
                          style: AppStyles.textStyle15White500,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
