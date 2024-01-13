import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/features/who_iam/presentation/view_model/who_iam_cubit.dart';
import 'package:kafil_task/features/who_iam/presentation/view_model/who_iam_states.dart';

import '../../../../../core/utils/app_services/local_services/cache_helper.dart';
import '../../../../../core/utils/app_services/remote_services/service_locator.dart';
import '../../../data/repos/who_iam_repo_imple.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt.get<ProfileRepoImpl>())..getProfileData(),
      child: BlocConsumer<ProfileCubit , ProfileStates>(
        listener: (context , state){

        },
        builder: (context , state){
          return Column(
            children: [

            ],
          );
        },
      ),
    );
  }
}
