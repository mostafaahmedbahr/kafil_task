import 'package:cached_network_image/cached_network_image.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kafil_task/core/shared_widgets/custom_text_form_filed.dart';
import 'package:kafil_task/core/utils/app_colors/app_colors.dart';
import 'package:kafil_task/features/countries/presentation/view_model/countries_states.dart';
import 'package:kafil_task/features/who_iam/presentation/view_model/who_iam_cubit.dart';
import 'package:kafil_task/features/who_iam/presentation/view_model/who_iam_states.dart';

import '../../../../../core/shared_widgets/custom_loading.dart';
 import '../../../../../core/utils/app_services/remote_services/service_locator.dart';
import '../../../data/repos/who_iam_repo_imple.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt.get<ProfileRepoImpl>())..getProfileData(),
      child: BlocConsumer<ProfileCubit , ProfileStates>(
        listener: (context , state){},
        builder: (context , state){

          if(state is GetProfileDataSuccessState){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 83,
                        width: 83,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CachedNetworkImage(
                          height: 103,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          imageUrl: "${state.profileModel.data!.avatar}",
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                          const CustomLoading(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
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
                               hintColor: const Color.fromRGBO(51, 51, 51, 1),
                               hintText: "${state.profileModel.data!.firstName}",
                               readOnly: true,
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
                               hintColor: const Color.fromRGBO(51, 51, 51, 1),
                               hintText: "${state.profileModel.data!.lastName}",
                               readOnly: true,
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
                      hintColor: const Color.fromRGBO(51, 51, 51, 1),
                      hintText: "${state.profileModel.data!.email}",
                      readOnly: true,
                    ),
                    const SizedBox(height: 16,),
                    const Text("User Type",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(105, 111, 121, 1)
                      ),),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        Row(
                          children: [
                            state.profileModel.data!.type!.name=="seller" ?
                            Container(
                              padding: const EdgeInsets.all(2),
                              height: 22,
                              width:  22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.mainColor
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.whiteColor
                              ),
                              child: Container(
                                height: 22,
                                width:  22,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.mainColor
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.mainColor
                                ),
                              ),
                            ) :
                            Container(
                              height: 22,
                              width:  22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.greyColor
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.whiteColor
                              ),
                            ),
                            const SizedBox(width: 16,),
                            const Text("Seller",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),),
                          ],
                        ),
                        const SizedBox(width: 24,),
                        Row(
                          children: [
                            state.profileModel.data!.type!.name=="buyer" ?
                            Container(
                              padding: const EdgeInsets.all(2),
                              height: 22,
                              width:  22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.mainColor
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.whiteColor
                              ),
                              child: Container(
                                height: 22,
                                width:  22,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.mainColor
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.mainColor
                                ),
                              ),
                            ) :
                            Container(
                              height: 22,
                              width:  22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.greyColor
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.whiteColor
                              ),
                            ),
                            const SizedBox(width: 16,),
                            const Text("Buyer",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),),
                          ],
                        ),
                        const SizedBox(width: 24,),
                        Row(
                          children: [
                            state.profileModel.data!.type!.name=="both" ?
                            Container(
                              padding: const EdgeInsets.all(2),
                              height: 22,
                              width:  22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.mainColor
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.whiteColor
                              ),
                              child: Container(
                                height: 22,
                                width:  22,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.mainColor
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.mainColor
                                ),
                              ),
                            ) :
                            Container(
                              height: 22,
                              width:  22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.greyColor
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.whiteColor
                              ),
                            ),
                            const SizedBox(width: 16,),
                            const Text("Both",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),),
                          ],
                        ),
                
                      ],
                    ),
                    const SizedBox(height: 16,),
                    const Text("About",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(105, 111, 121, 1)
                      ),),
                    Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color.fromRGBO(249, 249, 249 , 1),
                        ),
                        child: Text("${state.profileModel.data!.about}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:   Color.fromRGBO(51, 51, 51, 1)
                          ),),
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
                      hintColor: const Color.fromRGBO(51, 51, 51, 1),
                      hintText: "SAR ${state.profileModel.data!.salary}",
                      readOnly: true,
                    ),
                    const SizedBox(height: 16,),
                    const Text("Birth Date",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(105, 111, 121, 1)
                      ),),
                    const SizedBox(height: 8,),
                    CustomTextFormField(
                      hintColor: const Color.fromRGBO(51, 51, 51, 1),
                      hintText: "${state.profileModel.data!.birthDate}",
                      readOnly: true,
                      icon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset("assets/images/svgs/calendar_svgrepo.com.svg"),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    const Text("Gender",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(105, 111, 121, 1)
                      ),),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        Row(
                          children: [
                            state.profileModel.data!.gender==1 ?
                            Container(
                              padding: const EdgeInsets.all(2),
                              height: 22,
                              width:  22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.mainColor
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.whiteColor
                              ),
                              child: Container(
                                height: 22,
                                width:  22,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.mainColor
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.mainColor
                                ),
                              ),
                            ) :
                            Container(
                              height: 22,
                              width:  22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.greyColor
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.whiteColor
                              ),
                            ),
                            const SizedBox(width: 16,),
                            const Text("Male",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),),
                          ],
                        ),
                        const SizedBox(width: 24,),
                        Row(
                          children: [
                            state.profileModel.data!.gender==0 ?
                            Container(
                              padding: const EdgeInsets.all(2),
                              height: 22,
                              width:  22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.mainColor
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.whiteColor
                              ),
                              child: Container(
                                height: 22,
                                width:  22,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.mainColor
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.mainColor
                                ),
                              ),
                            ) :
                            Container(
                              height: 22,
                              width:  22,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.greyColor
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.whiteColor
                              ),
                            ),
                            const SizedBox(width: 16,),
                            const Text("Female",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),),
                          ],
                        ),
                
                      ],
                    ),
                    const SizedBox(height: 16,),
                    const Text("Skills",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(105, 111, 121, 1)
                      ),),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromRGBO(249, 249, 249, 1),
                      ),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.profileModel.data!.tags!.length,
                        gridDelegate:   const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio : 5,
                        ),
                        itemBuilder: (BuildContext context, int index){
                          return Container(
                            width: 137,
                            height: 34,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(233, 249, 241, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text("${state.profileModel.data!.tags![index].name}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainColor,
                              ),),
                            ),
                          );
                        },
                      )),
                    const SizedBox(height: 16,),
                    const Text("Favourite Social Media",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(105, 111, 121, 1)
                    ),),
                    const SizedBox(height: 16,),
                    Column(
                      children: [
                        Row(
                          children: [
                          Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.greyColor.withOpacity(.5),
                              ),
                              borderRadius: BorderRadius.circular(2),
                              color:state.profileModel.data!.favoriteSocialMedia![0]=="facebook" ?
                              AppColors.mainColor : AppColors.whiteColor,
                            ),
                            child: const Icon(Icons.check,
                            size: 15,
                            color: AppColors.whiteColor,),
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
                            Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.greyColor.withOpacity(.5),
                                ),
                                borderRadius: BorderRadius.circular(2),
                                color:state.profileModel.data!.favoriteSocialMedia![0]=="twitter" ?
                                AppColors.mainColor : AppColors.whiteColor,
                              ),
                              child: const Icon(Icons.check,
                                size: 15,
                                color: AppColors.whiteColor,),
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
                            Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.greyColor.withOpacity(.5),
                                ),
                                borderRadius: BorderRadius.circular(2),
                                color:state.profileModel.data!.favoriteSocialMedia![0]=="linkedIn" ?
                                AppColors.mainColor : AppColors.whiteColor,
                              ),
                              child: const Icon(Icons.check,
                                size: 15,
                                color: AppColors.whiteColor,),
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
                  ],
                ),
              ),
            );
          }
          else if (state is GetAllCountriesLoadingState){
            return const CustomLoading();
          }
          else{
            return const Text("Error");
          }
        },
      ),
    );
  }
}
