 import 'package:flutter/material.dart';

import 'package:kafil_task/features/services/presentation/views/widgets/popular_services_widget.dart';
import 'package:kafil_task/features/services/presentation/views/widgets/services_widget.dart';


class ServicesViewBody extends StatelessWidget {
  const ServicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ServicesWidget(),
        PopularServicesWidget(),
      ],
    );
  }
}
