import 'package:flutter/material.dart';
import 'package:kafil_task/features/who_iam/presentation/views/widgets/profile_view_body.dart';

import '../../../../core/utils/app_services/local_services/cache_helper.dart';
import '../../../../core/utils/app_strings/app_strings.dart';
import '../../../layout/presentation/views/widgets/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      appBar: CustomAppBar(
        title:
        AppStrings.whoAmI,
        isLoginScreen: false,
      ),
      body: ProfileViewBody(),
    ));
  }
}
