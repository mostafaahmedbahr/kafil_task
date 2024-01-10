
import 'package:flutter/material.dart';
import 'package:kafil_task/features/layout/presentation/views/widgets/custom_app_bar.dart';
import 'package:kafil_task/features/layout/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:kafil_task/features/layout/presentation/views/widgets/layout_view_body.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        // appBar:   CustomAppBar(),
        body:   const LayoutViewBody(),
        bottomNavigationBar: const  CustomBottomNavigationBar(),
      ),
    );
  }
}
