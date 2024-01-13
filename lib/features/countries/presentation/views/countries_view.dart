import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings/app_strings.dart';
import '../../../layout/presentation/views/widgets/custom_app_bar.dart';
import 'widgets/countries_view_body.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      backgroundColor: Colors.grey.withOpacity(.1),
      appBar: const CustomAppBar(
        title: AppStrings.countries,
        isLoginScreen: false,
      ),
      body: const CountriesViewBody(),
    ));
  }
}
