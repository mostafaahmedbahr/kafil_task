import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:kafil_task/features/register/presentation/views/widgets/register_stepper_widget.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegisterStepperWidget(),
          // RegisterForm1Widget(),
          // NextButton(),
        ],
      ),
    );
  }
}
