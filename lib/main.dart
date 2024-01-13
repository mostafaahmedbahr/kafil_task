import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafil_task/core/utils/app_colors/app_colors.dart';
import 'package:kafil_task/features/layout/presentation/views/layout_view.dart';
import 'package:kafil_task/features/login/presentation/view_model/login_cubit.dart';
import 'package:kafil_task/features/register/presentation/views/register_view.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'core/utils/app_services/local_services/cache_helper.dart';
import 'core/utils/app_services/remote_services/service_locator.dart';
import 'core/utils/bloc_observer.dart';
import 'features/layout/data/repos/layout_repo_implementation.dart';
import 'features/layout/presentation/view_model/layout_cubit.dart';
import 'features/login/data/repos/login_repo_imple.dart';
import 'features/login/presentation/login_view.dart';
import 'features/services/presentation/views/services_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  setup();
  Bloc.observer = SimpleBlocObserver();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => LoginCubit(getIt.get<LoginRepoImpl>())),

        BlocProvider(
            create: (context) => LayoutCubit(getIt.get<LayoutRepoImpl>())),
      ],
      child: MaterialApp(
        theme: ThemeData(
          // scaffoldBackgroundColor:AppColors.whiteColor,
          fontFamily: "Montserrat"
        ),
        title: 'Task',
        debugShowCheckedModeBanner: false,
        home: const LoginView(),
        builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
      ),
    );
  }
}
