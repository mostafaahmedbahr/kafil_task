 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/layout_cubit.dart';
import '../../view_model/layout_states.dart';

class LayoutViewBody extends StatelessWidget {
  const LayoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit , LayoutStates>(
        builder: (context , state) {
          var layoutCubit = LayoutCubit.get(context);
          return Scaffold(
            body: layoutCubit.screens[LayoutCubit.newPageIndex],
          );
        }

    );
  }
}
