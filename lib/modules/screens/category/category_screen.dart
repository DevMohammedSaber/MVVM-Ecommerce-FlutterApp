import 'package:e_commerce_app_api_cubit/modules/widgets/arrow_back_icon.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/category/widgets/category_body.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const routeName = 'categoryScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackIcon(),
      ),
      body: const CategoryScreenBody(),
    );
  }
}
