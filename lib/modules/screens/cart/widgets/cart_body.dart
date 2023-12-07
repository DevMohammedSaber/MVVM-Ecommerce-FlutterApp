import 'package:e_commerce_app_api_cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/cart/widgets/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../shared/constant/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return cubit.cartList.isEmpty
            ? Center(
                child: Lottie.asset('assets/lottie/empty.json', repeat: false))
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: ListView.builder(
                  itemCount: cubit.cartList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                      key: Key(cubit.cartList[index].id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          cubit.addOrRemoveFromCart(
                              id: cubit.cartList[index].id.toString());
                        });
                      },
                      background: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const Spacer(),
                            SvgPicture.asset("assets/icons/Trash.svg"),
                          ],
                        ),
                      ),
                      child: CartCard(product: cubit.cartList[index]),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
