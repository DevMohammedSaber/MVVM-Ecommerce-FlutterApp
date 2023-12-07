import 'package:e_commerce_app_api_cubit/shared/constant/size_config.dart';
import 'package:flutter/material.dart';

import '../../../../layout/layout_cubit/layout_cubit.dart';
import '../../../../shared/constant/colors.dart';
import '../../../../shared/static/onboarding_model.dart';

class TextPageView extends StatelessWidget {
  const TextPageView({
    super.key,
    required this.cubit,
  });
  final LayoutCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Text(
            onBoardingList[cubit.pageIndex].title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: kTextColor, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Text(
            onBoardingList[cubit.pageIndex].body,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: kTextColor),
          ),
        ],
      ),
    );
  }
}
