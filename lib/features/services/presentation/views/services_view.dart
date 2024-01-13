 import 'package:flutter/material.dart';
import 'package:kafil_task/core/utils/app_strings/app_strings.dart';
 import 'package:kafil_task/features/layout/presentation/views/widgets/custom_app_bar.dart';
import 'package:kafil_task/features/services/presentation/views/widgets/services_view_body.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      appBar: CustomAppBar(
        title:
          AppStrings.services,
        isLoginScreen: false,
      ),
      body: ServicesViewBody(),
    ));
  }
}
