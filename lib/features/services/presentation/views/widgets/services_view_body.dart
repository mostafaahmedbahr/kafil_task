 import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafil_task/core/shared_widgets/custom_sized_box.dart';
import 'package:kafil_task/core/utils/app_colors/app_colors.dart';
import 'package:kafil_task/core/utils/app_images/app_images.dart';
import 'package:kafil_task/core/utils/app_images/app_svgs.dart';
import 'package:kafil_task/core/utils/app_strings/app_strings.dart';
import 'package:kafil_task/core/utils/app_styles/app_styles.dart';

class ServicesViewBody extends StatelessWidget {
  const ServicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(AppStrings.services,
              style: AppStyles.textStyle18Black800,),
              const CustomSizedBox(height: 32,),
             SizedBox(
               height: 192,
               child: ListView.separated(
                 scrollDirection: Axis.horizontal,
                   itemBuilder: (context , index){
                     return  Container(
                       height: 192,
                       width: 157,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8),
                         color: AppColors.whiteColor,
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(3),
                         child: Column(
                           children: [
                             Stack(
                               alignment: Alignment.bottomLeft,
                               children: [
                                 Image.asset(AppImages.product,
                                   height: 103,
                                   width: double.infinity,
                                   fit: BoxFit.cover,
                                 ),
                                 Positioned(
                                   bottom: 10,
                                   left: 10,
                                   child: Container(
                                     height: 26,
                                     width: 60,
                                     decoration: BoxDecoration(
                                       color: AppColors.mainColor,
                                       borderRadius: BorderRadius.circular(27),
                                     ),
                                     child: const Center(
                                       child: Text("\$100",
                                         style: TextStyle(
                                             color: AppColors.whiteColor
                                         ),),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                             Padding(
                               padding: const EdgeInsets.all(9.0),
                               child: Column(
                                 children: [
                                   const Text(AppStrings.des,
                                     style: AppStyles.textStyle11Black500,),
                                   const CustomSizedBox(height: 10,),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                       const Row(
                                         children: [
                                           Icon(Icons.star,
                                             size: 20,
                                             color: AppColors.yellowColor,),
                                           Text(" (4.5) ",
                                             style: AppStyles.textStyle11Black400,),
                                         ],
                                       ),
                                       Container(
                                         height: 10,
                                         width: 1,
                                         color: const Color(0xffC3C5C8),
                                       ),
                                       Row(
                                         children: [
                                           SvgPicture.asset(AppSvgs.cart),
                                           const SizedBox(width: 10,),
                                           const Text("20",
                                             style: AppStyles.textStyle10gray400,),
                                         ],
                                       )
                                     ],
                                   ),
                                 ],
                               ),
                             ),

                           ],
                         ),
                       ),
                     );
                   },
                   separatorBuilder: (context , index){
                     return const CustomSizedBox(width: 8,);
                   },
                   itemCount: 10,
               ),
             ),
              const CustomSizedBox(height: 40,),
              const Text(AppStrings.popularServices,
                style: AppStyles.textStyle18Black800,),
              const CustomSizedBox(height: 32,),
              SizedBox(
                height: 192,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index){
                    return  Container(
                      height: 192,
                      width: 157,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Image.asset(AppImages.product,
                                  height: 103,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: Container(
                                    height: 26,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: AppColors.mainColor,
                                      borderRadius: BorderRadius.circular(27),
                                    ),
                                    child: const Center(
                                      child: Text("\$100",
                                        style: TextStyle(
                                            color: AppColors.whiteColor
                                        ),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Column(
                                children: [
                                  const Text(AppStrings.des,
                                    style: AppStyles.textStyle11Black500,),
                                  const CustomSizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(Icons.star,
                                            size: 20,
                                            color: AppColors.yellowColor,),
                                          Text(" (4.5) ",
                                            style: AppStyles.textStyle11Black400,),
                                        ],
                                      ),
                                      Container(
                                        height: 10,
                                        width: 1,
                                        color: const Color(0xffC3C5C8),
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(AppSvgs.cart),
                                          const SizedBox(width: 10,),
                                          const Text("20",
                                            style: AppStyles.textStyle10gray400,),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context , index){
                    return const CustomSizedBox(width: 8,);
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
