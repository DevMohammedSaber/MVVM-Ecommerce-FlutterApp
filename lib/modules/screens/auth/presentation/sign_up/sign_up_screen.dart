import 'package:e_commerce_app_api_cubit/modules/screens/auth/presentation/login/login_screen.dart';
import 'package:e_commerce_app_api_cubit/modules/widgets/arrow_back_icon.dart';
import 'package:e_commerce_app_api_cubit/modules/widgets/auth_account_text.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/socal_card.dart';
import '../../../../../shared/constant/constants.dart';
import '../../../../../shared/constant/size_config.dart';

import 'widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        leading: const ArrowBackIcon(),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text("Register Account", style: headingStyle),
                  const Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  const SignUpForm(),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  AuthAccountText(
                    onTap: () => Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName),
                    title: "Don’t have an account? ",
                    btnText: "Sign In",
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Text(
                    'By continuing your confirm that you agree \nwith our Term and Condition',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
