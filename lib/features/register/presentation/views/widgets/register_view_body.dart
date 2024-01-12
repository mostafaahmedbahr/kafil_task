
import 'package:flutter/cupertino.dart';
import 'package:kafil_task/features/register/presentation/views/widgets/next_button.dart';
import 'package:kafil_task/features/register/presentation/views/widgets/register_form1_widget.dart';
import 'package:kafil_task/features/register/presentation/views/widgets/register_stepper_widget.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegisterStepperWidget(),
          RegisterForm1Widget(),
          NextButton(),
        ],
      ),
    );
  }
}
