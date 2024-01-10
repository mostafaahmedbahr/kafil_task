import 'package:flutter/material.dart';
import 'package:kafil_task/core/shared_widgets/custom_sized_box.dart';
import 'package:kafil_task/core/utils/app_colors/app_colors.dart';
import 'package:kafil_task/core/utils/app_strings/app_strings.dart';
import 'package:kafil_task/core/utils/app_styles/app_styles.dart';

class RegisterStepperWidget extends StatelessWidget {
  const RegisterStepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
              style: AppStyles.textStyle12Gray600,),
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
                color: AppColors.greyColor,
              ),
            ),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.whiteColor,
                border: Border.all(
                    color:  AppColors.greyColor,
                ),
              ),
              child: const Center(
                child: Text("2",
                  style: AppStyles.textStyle12Gray600,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 2,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
