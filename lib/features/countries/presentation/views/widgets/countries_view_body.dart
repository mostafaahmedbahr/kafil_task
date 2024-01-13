import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/core/shared_widgets/custom_loading.dart';
import 'package:kafil_task/core/utils/app_colors/app_colors.dart';
import 'package:kafil_task/features/countries/presentation/view_model/countries_cubit.dart';
import 'package:kafil_task/features/countries/presentation/view_model/countries_states.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../../../../core/utils/app_services/remote_services/service_locator.dart';
import '../../../data/repos/countries_repo_imple.dart';

class CountriesViewBody extends StatefulWidget {
  const CountriesViewBody({super.key});

  @override
  State<CountriesViewBody> createState() => _CountriesViewBodyState();
}

class _CountriesViewBodyState extends State<CountriesViewBody> {
  @override
  Widget build(BuildContext context) {
    final NumberPaginatorController _controller = NumberPaginatorController();
      int _currentPage;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocProvider(
          create: (context) => CountriesCubit(getIt.get<CountriesRepoImpl>())..getAllCountriesData(),
        child: BlocConsumer<CountriesCubit , CountriesStates>(
          listener: (context , state){},
          builder: (context , state){
            return  ConditionalBuilder(
              condition: state is ! GetAllCountriesLoadingState,
              fallback: (context){
                return const CustomLoading();
              },
              builder : (context){
                if(state is GetAllCountriesSuccessState) {
                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 14),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child:
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 50),
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(10),
                                       color: AppColors.greyColor.withOpacity(.5),
                                     ),
                                  child:  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Country",
                                        style:  TextStyle(
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16
                                        ),),
                                      Text("Capital",
                                        style:  TextStyle(
                                            color: AppColors.blackColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16
                                        ),),
                                    ],
                                  ),
                                ),
                               const SizedBox(height: 10,),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.separated(
                                      itemBuilder: (context , index){
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("${state.countriesModel.data![index].name}",
                                            style: const TextStyle(
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16
                                            ),),
                                            Text("${state.countriesModel.data![index].capital}",
                                              style: const TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16
                                              ),),
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context , index){
                                        return const Divider();
                                      },
                                      itemCount: state.countriesModel.data!.length,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24,),
                      NumberPaginator(
                        // by default, the paginator shows numbers as center content
                        numberPages: 10,
                        onPageChange: (int index) {
                          setState(() {
                            _currentPage =
                                index; // _currentPage is a variable within State of StatefulWidget
                          });
                        },
                        // initially selected index
                        initialPage: 4,
                        config: NumberPaginatorUIConfig(
                          // default height is 48
                          height: 50,
                          buttonShape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: .5,
                            ),
                          ),
                          buttonSelectedForegroundColor: AppColors.blackColor,
                          buttonUnselectedForegroundColor: Colors.black,
                          buttonUnselectedBackgroundColor: Colors.white,
                          buttonSelectedBackgroundColor: AppColors.mainColor,
                        ),
                      )
                    ],
                  );
                }
                return const Text("Error");
              },
            );
          },

        ),
      ),
    );
  }
}
