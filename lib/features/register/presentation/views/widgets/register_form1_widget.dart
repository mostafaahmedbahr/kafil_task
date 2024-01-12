import 'package:flutter/cupertino.dart';
import 'package:kafil_task/core/shared_widgets/custom_sized_box.dart';
import 'package:kafil_task/core/shared_widgets/custom_text_form_filed.dart';
import 'package:kafil_task/core/utils/app_strings/app_strings.dart';

import 'form1_item_widget.dart';

class RegisterForm1Widget extends StatelessWidget {
  const RegisterForm1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Form1itemWidget(
         title: AppStrings.password,
         controller: TextEditingController(),
       ),
      ],
    );
  }
}
