import 'package:e_commerce_app_api_cubit/modules/screens/special_offers/widgets/special_offers_body.dart';
import 'package:flutter/material.dart';

class SpecialOffersScreen extends StatelessWidget {
  const SpecialOffersScreen({super.key});
  static const routeName = 'specialOffersScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SpecialOffersScreenBody(),
    );
  }
}
