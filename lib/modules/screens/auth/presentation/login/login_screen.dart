import 'package:flutter/material.dart';

import 'widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
