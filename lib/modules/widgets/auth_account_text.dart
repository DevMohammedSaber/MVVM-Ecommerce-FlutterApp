import 'package:flutter/material.dart';

import '../../shared/constant/colors.dart';
import '../../shared/constant/size_config.dart';

class AuthAccountText extends StatelessWidget {
  const AuthAccountText({
    Key? key,
    required this.title,
    required this.btnText,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String btnText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            btnText,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
