import 'package:e_commerce_app_api_cubit/modules/screens/details/widgets/details_body.dart';
import 'package:flutter/material.dart';
import '../../../models/product_model.dart';
import 'widgets/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel agrs =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: const CustomAppBar(),
      ),
      body: DetailsScreenBody(product: agrs),
    );
  }
}
