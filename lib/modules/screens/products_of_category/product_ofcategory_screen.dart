import 'package:e_commerce_app_api_cubit/modules/screens/products_of_category/widgets/product_of_category_body.dart';
import 'package:e_commerce_app_api_cubit/modules/widgets/arrow_back_icon.dart';
import 'package:flutter/material.dart';

class ProductOfCategoryScreen extends StatelessWidget {
  const ProductOfCategoryScreen({
    super.key,
  });
  static const routeName = 'productsOfCategoryScreen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackIcon(),
        title: Text(args['name']),
      ),
      body: ProductOfCategoryBody(categoryId: args['id']),
    );
  }
}
