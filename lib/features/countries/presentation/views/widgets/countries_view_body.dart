import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kafil_task/core/utils/app_colors/app_colors.dart';
import 'package:number_paginator/number_paginator.dart';

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
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6 , vertical: 14),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),

            // ListView.separated(
            //     itemBuilder: itemBuilder,
            //     separatorBuilder: separatorBuilder,
            //     itemCount: itemCount,
            // ),
          ),
          const SizedBox(height: 24,),
          NumberPaginator(
            // by default, the paginator shows numbers as center content
            numberPages: 10,
            onPageChange: (int index) {
              setState(() {
                _currentPage = index; // _currentPage is a variable within State of StatefulWidget
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
              buttonSelectedBackgroundColor:  AppColors.mainColor,
            ),
          )
        ],
      ),
    );
  }
}
