import 'package:e_commerce_app_api_cubit/modules/screens/all_product/all_products_screen.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/category/category_screen.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/home/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../layout/layout_cubit/layout_cubit.dart';
import '../../../../shared/constant/size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return SafeArea(
          child: BlocProvider.of<LayoutCubit>(context).productsList.isEmpty
              ? Center(
                  child: Lottie.asset('assets/lottie/loading.json'),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: Column(
                      children: [
                        SizedBox(height: getProportionateScreenHeight(20)),
                        const HomeHeader(),
                        SizedBox(height: getProportionateScreenWidth(10)),
                        const DiscountBanner(),
                        SizedBox(height: getProportionateScreenWidth(10)),
                        SectionTitle(
                          title: "Categories",
                          press: () {
                            Navigator.of(context)
                                .pushNamed(CategoryScreen.routeName);
                          },
                        ),
                        SizedBox(height: getProportionateScreenWidth(10)),
                        const Categories(),
                        SizedBox(height: getProportionateScreenWidth(10)),
                        SectionTitle(
                          title: "Products",
                          press: () {
                            Navigator.of(context)
                                .pushNamed(AllProductScreen.routeName);
                          },
                        ),
                        SizedBox(height: getProportionateScreenWidth(10)),
                        const DisplayProducts(),
                        SizedBox(height: getProportionateScreenWidth(10)),
                        SectionTitle(
                          title: "Special for you",
                          press: () {},
                        ),
                        SizedBox(height: getProportionateScreenWidth(10)),
                        const SpecialOffers(),
                        SizedBox(height: getProportionateScreenWidth(10)),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
