import 'package:e_commerce_app_api_cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/details/widgets/product_description.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/details/widgets/product_images.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/details/widgets/top_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/product_model.dart';
import '../../../../shared/constant/size_config.dart';
import '../../../widgets/default_button.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight,
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: ProductDescription(
              product: product,
              pressOnSeeMore: () {},
            ),
          ),
          const Spacer(),
          // ColorDots(product: product),
          const Spacer(),
          TopRoundedContainer(
            color: const Color(0xFFF6F7F9),
            child: TopRoundedContainer(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.15,
                  vertical: getProportionateScreenWidth(20),
                ),
                child: DefaultButton(
                  text: BlocProvider.of<LayoutCubit>(context)
                          .cartId
                          .contains(product.id.toString())
                      ? 'Remove From Cart'
                      : "Add To Cart",
                  onPressed: () {
                    BlocProvider.of<LayoutCubit>(context)
                        .addOrRemoveFromCart(id: product.id.toString());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
