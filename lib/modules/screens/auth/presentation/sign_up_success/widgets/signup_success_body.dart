import 'package:flutter/material.dart';
import 'package:e_commerce_app_api_cubit/modules/widgets/default_button.dart';
import 'package:e_commerce_app_api_cubit/shared/constant/size_config.dart';

import '../../login/login_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            onPressed: () {
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
