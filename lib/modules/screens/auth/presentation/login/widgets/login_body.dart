import 'package:e_commerce_app_api_cubit/modules/screens/auth/presentation/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app_api_cubit/modules/widgets/auth_account_text.dart';
import 'package:e_commerce_app_api_cubit/modules/widgets/socal_card.dart';
import '../../../../../../shared/constant/size_config.dart';
import 'login_form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                const LoginForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
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
                  onTap: () =>
                      Navigator.of(context).pushNamed(SignUpScreen.routeName),
                  title: "Don’t have an account? ",
                  btnText: "Sign Up",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
