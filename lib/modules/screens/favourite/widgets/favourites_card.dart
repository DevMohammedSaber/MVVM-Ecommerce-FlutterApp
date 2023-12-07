import 'package:e_commerce_app_api_cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app_api_cubit/shared/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app_api_cubit/models/product_model.dart';

import '../../../../shared/constant/size_config.dart';

class FavouritesCard extends StatefulWidget {
  const FavouritesCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  State<FavouritesCard> createState() => _FavouritesCardState();
}

class _FavouritesCardState extends State<FavouritesCard> {
  @override
  Widget build(BuildContext context) {
    LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);

    return SizedBox(
      width: getProportionateScreenWidth(200),
      height: getProportionateScreenHeight(450),
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1.05,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                  color: kGreyShade2.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: widget.product.id.toString(),
                  child: Image.network(widget.product.image!),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: getProportionateScreenWidth(200),
                  ),
                  child: Text(
                    widget.product.name!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black),
                    maxLines: 2,
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
                Text(
                  "\$ ${widget.product.price}",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    cubit.addOrRemoveFromCart(id: widget.product.id.toString());
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(getProportionateScreenWidth(150),
                        getProportionateScreenHeight(40)),
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Add to Cart'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cubit.addOrRemoveFromFavourites(
                          id: widget.product.id.toString());
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(getProportionateScreenWidth(150),
                        getProportionateScreenHeight(40)),
                    backgroundColor: kFillColorThird,
                    foregroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Remove'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
