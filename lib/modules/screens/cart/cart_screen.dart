import 'package:flutter/material.dart';

import 'widgets/cart_body.dart';
import 'widgets/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Body(),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}
