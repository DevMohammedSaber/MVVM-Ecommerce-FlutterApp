// We use name route
// All our routes will be available here
import 'package:e_commerce_app_api_cubit/layout/layout_screen.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/all_product/all_products_screen.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/products_of_category/product_ofcategory_screen.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/category/category_screen.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/my_account/my_account_screen.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/special_offers/special_offers_screen.dart';
import 'package:flutter/material.dart';

import '../../modules/screens/auth/presentation/forgot_password/forgot_password_screen.dart';
import '../../modules/screens/auth/presentation/login/login_screen.dart';
import '../../modules/screens/auth/presentation/sign_up_success/signup_success_screen.dart';
import '../../modules/screens/auth/presentation/sign_up/sign_up_screen.dart';
import '../../modules/screens/cart/cart_screen.dart';
import '../../modules/screens/details/details_screen.dart';
import '../../modules/screens/home/home_screen.dart';
import '../../modules/screens/profile/profile_screen.dart';
import '../../modules/screens/onboarding/onboarding_screen.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  SignUpSuccessScreen.routeName: (context) => const SignUpSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  MyAccount.routeName: (context) => const MyAccount(),
  LayoutScreen.routeName: (context) => const LayoutScreen(),
  CategoryScreen.routeName: (context) => const CategoryScreen(),
  SpecialOffersScreen.routeName: (context) => const SpecialOffersScreen(),
  AllProductScreen.routeName: (context) => const AllProductScreen(),
  ProductOfCategoryScreen.routeName: (context) =>
      const ProductOfCategoryScreen(),
};
