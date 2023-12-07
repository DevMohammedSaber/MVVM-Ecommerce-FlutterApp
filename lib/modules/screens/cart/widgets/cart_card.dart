import 'package:e_commerce_app_api_cubit/models/product_model.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layout/layout_cubit/layout_cubit.dart';
import '../../../../shared/constant/colors.dart';
import '../../../../shared/constant/size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          DetailsScreen.routeName,
          arguments: product,
        );
      },
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(product.images![0]),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints:
                    BoxConstraints(maxWidth: getProportionateScreenWidth(200)),
                child: Text(
                  product.name!,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: "\$${product.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: kPrimaryColor),
                      children: [
                        TextSpan(
                            text: "         x 1",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(30)),
                  MaterialButton(
                    onPressed: () {
                      BlocProvider.of<LayoutCubit>(context)
                          .addOrRemoveFromCart(id: product.id.toString());
                    },
                    color: kGreyShade3,
                    elevation: 0,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    child: const Text('Remove'),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
