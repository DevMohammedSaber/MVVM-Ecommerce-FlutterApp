import 'package:e_commerce_app_api_cubit/modules/widgets/arrow_back_icon.dart';
import 'package:flutter/material.dart';

import 'widgets/my_account_body.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  static const routeName = 'myAccountScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const ArrowBackIcon(),
      ),
      body: MyAccountBody(),
    );
  }
}
