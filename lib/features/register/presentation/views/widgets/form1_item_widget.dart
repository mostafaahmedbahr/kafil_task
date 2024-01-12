import 'package:flutter/cupertino.dart';

import '../../../../../core/shared_widgets/custom_sized_box.dart';
import '../../../../../core/shared_widgets/custom_text_form_filed.dart';

class Form1itemWidget extends StatelessWidget {
  const Form1itemWidget({super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const CustomSizedBox(height: 8,),
        CustomTextFormField(
          controller: controller,
        ),
      ],
    );
  }
}
