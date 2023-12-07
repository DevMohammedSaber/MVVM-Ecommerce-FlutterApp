import 'package:e_commerce_app_api_cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app_api_cubit/modules/widgets/product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/constant/size_config.dart';

class DisplayProducts extends StatelessWidget {
  const DisplayProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<LayoutCubit, LayoutStates>(
        builder: (context, state) {
          LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
          return SizedBox(
            width: getProportionateScreenWidth(350),
            height: getProportionateScreenHeight(210),
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.only(right: getProportionateScreenWidth(20)),
                  child: ProductCard(product: cubit.productsList[index]),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
