import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafil_task/core/shared_widgets/custom_loading.dart';
import 'package:kafil_task/core/shared_widgets/custom_sized_box.dart';
import 'package:kafil_task/core/shared_widgets/shimmer_loading.dart';
import 'package:kafil_task/core/utils/app_colors/app_colors.dart';
 import 'package:kafil_task/core/utils/app_images/app_svgs.dart';
import 'package:kafil_task/core/utils/app_strings/app_strings.dart';
import 'package:kafil_task/core/utils/app_styles/app_styles.dart';
import 'package:kafil_task/features/services/presentation/view_model/services_cubit.dart';
import 'package:kafil_task/features/services/presentation/view_model/services_states.dart';
import '../../../../../core/utils/app_services/remote_services/service_locator.dart';
import '../../../data/repos/services_repo_imple.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesCubit(
          getIt.get<ServicesRepoImpl>())..getAllServicesData(),
      child: BlocConsumer<ServicesCubit , ServicesStates>(
        listener: (context , state){},
        builder: (context , state){
          if(state is GetAllServicesDataSuccessState){
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
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
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        height: 103,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        imageUrl: "${state.servicesModel.data![index].mainImage}",
                                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                                        const CustomLoading(),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
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
                                        child:   Center(
                                          child: Text("\$${state.servicesModel.data![index].price}",
                                            style: const TextStyle(
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
                                      Text("${state.servicesModel.data![index].title}",
                                        style: AppStyles.textStyle11Black500,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,),
                                      const CustomSizedBox(height: 10,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(Icons.star,
                                                size: 20,
                                                color: AppColors.yellowColor,),
                                              Text("${state.servicesModel.data![index].averageRating}",
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
                                              Text("${state.servicesModel.data![index].completedSalesCount}",
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
                      itemCount: state.servicesModel.data!.length,
                    ),
                  ),
                  const CustomSizedBox(height: 40,),
                ],
              ),
            );
          }
          else if(state is GetAllServicesDataLoadingState){
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(AppStrings.services,
                    style: AppStyles.textStyle18Black800,),
                  const CustomSizedBox(height: 32,),
                  SizedBox(
                    height: 192,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context , index){
                        return const SimmerLoading(
                            height: 192,
                            width: 157,
                            raduis: 8);
                      },
                      separatorBuilder: (context , index){
                        return const SizedBox(width: 8,);
                      },
                      itemCount: 5,
                    ),
                  ),
                  const CustomSizedBox(height: 40,),
                ],
              ),
            );
          }
          return const Center(
            child: Text("Error"),
          );
        },
      ),
    );
  }
}
