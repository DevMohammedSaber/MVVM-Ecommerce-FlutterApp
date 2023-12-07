import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/constant/colors.dart';
import '../../shared/constant/size_config.dart';

class ArrowBackIcon extends StatelessWidget {
  const ArrowBackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
        ),
        onPressed: () => Navigator.pop(context),
        child: SvgPicture.asset(
          "assets/icons/Back ICon.svg",
          height: 15,
        ),
      ),
    );
  }
}
