import 'package:e_commerce_app_api_cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/auth/presentation/login/login_screen.dart';
import '../../../../shared/constant/colors.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constant/size_config.dart';
import '../../../../shared/static/onboarding_model.dart';

class IllistrationPageView extends StatelessWidget {
  const IllistrationPageView({
    super.key,
    required this.cubit,
  });
  final LayoutCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.grey.shade100,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                  child: Text(
                    'Skip',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: kPrimaryColor),
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            SizedBox(
              height: getProportionateScreenHeight(350),
              width: double.infinity,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  cubit.pageIndex = index;
                },
                controller: cubit.controller,
                itemCount: onBoardingList.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    onBoardingList[cubit.pageIndex].image,
                  );
                },
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
          ],
        ),
      ),
    );
  }
}
