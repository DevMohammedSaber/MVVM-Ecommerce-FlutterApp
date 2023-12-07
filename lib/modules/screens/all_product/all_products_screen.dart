import 'package:e_commerce_app_api_cubit/modules/screens/all_product/widgets/all_product_body.dart';
import 'package:flutter/material.dart';

import '../../widgets/arrow_back_icon.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});
  static const routeName = 'allProductScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackIcon(),
        title: const Text('All Product'),
      ),
      body: const AllProductScreenBody(),
    );
  }
}
