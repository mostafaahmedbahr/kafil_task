
import 'package:flutter/material.dart';
  import 'package:kafil_task/core/utils/app_styles/app_styles.dart';



//ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isLoginScreen;


    const CustomAppBar(
      {Key? key,
        this.title, required this.isLoginScreen,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              if(isLoginScreen != false)
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new,
                  size: 15,),
              ),
                Text(
                  title ?? "",
              style: AppStyles.textStyle18Black800,
              ),
            ],
          ),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
