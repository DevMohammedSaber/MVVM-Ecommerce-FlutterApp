import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layout/layout_cubit/layout_cubit.dart';
import '../../../../shared/constant/size_config.dart';
import '../../../widgets/product_card.dart';

class AllProductScreenBody extends StatelessWidget {
  const AllProductScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
    return Container(
      width: SizeConfig.screenWidth,
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20,
        ),
        itemCount: cubit.productsList.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: cubit.productsList[index],
          );
        },
      ),
    );
  }
}
