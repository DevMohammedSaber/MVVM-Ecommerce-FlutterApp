import 'package:flutter/material.dart';

import 'widgets/signup_success_body.dart';

class SignUpSuccessScreen extends StatelessWidget {
  static String routeName = "/sign_up_success";

  const SignUpSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Sign Up Success"),
      ),
      body: const Body(),
    );
  }
}
