import 'package:e_commerce_app_api_cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app_api_cubit/layout/layout_screen.dart';
import 'package:e_commerce_app_api_cubit/shared/network/sharedpreferences_service.dart';
import 'package:e_commerce_app_api_cubit/shared/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app_api_cubit/shared/constant/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/screens/auth/auth_cubit/auth_cubit.dart';
import 'modules/screens/onboarding/onboarding_screen.dart';
import 'shared/bloc_observer/bloc_observer.dart';
import 'shared/constant/size_config.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await SharedpreferencesService.initialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(
          create: (context) => LayoutCubit()
            ..getBannerData()
            ..getCategoriesData()
            ..getProductsData()
            ..getFavourites()
            ..getCartItems(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Flutter Way - Template',
        theme: AppTheme.lightTheme(context),
        initialRoute: SharedpreferencesService.getData(key: 'token') != null
            ? LayoutScreen.routeName
            : OnBoardingScreen.routeName,
        routes: routes,
      ),
    );
  }
}
