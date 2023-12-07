import 'package:e_commerce_app_api_cubit/modules/screens/auth/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import '../../../../shared/constant/colors.dart';
import '../../../../shared/constant/size_config.dart';
import '../../../../shared/static/onboarding_model.dart';
import '../../../widgets/default_button.dart';

class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({super.key});

  @override
  State<OnboardingScreenBody> createState() => _OnboardingScreenBodyState();
}

class _OnboardingScreenBodyState extends State<OnboardingScreenBody> {
  int pageIndex = 0;
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
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
                          Navigator.of(context)
                              .pushReplacementNamed(LoginScreen.routeName);
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
                        setState(() {
                          pageIndex = index;
                        });
                      },
                      controller: controller,
                      itemCount: onBoardingList.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          onBoardingList[pageIndex].image,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                ],
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                Text(
                  onBoardingList[pageIndex].title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: kTextColor, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  onBoardingList[pageIndex].body,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: kTextColor),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: getProportionateScreenWidth(150),
            height: getProportionateScreenHeight(10),
            child: PageViewDotIndicator(
              currentItem: pageIndex,
              count: 3,
              unselectedColor: kPrimaryColor.withOpacity(.2),
              selectedColor: kPrimaryColor,
              size: const Size(40, 8),
              unselectedSize: const Size(8, 8),
              duration: const Duration(milliseconds: 300),
              alignment: Alignment.centerLeft,
              // fadeEdges: false,
              boxShape: BoxShape.rectangle, //defaults to circle
              borderRadius: BorderRadius.circular(5), //only for rectangle shape
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: DefaultButton(
                text: pageIndex < onBoardingList.length - 1
                    ? 'Next'
                    : 'Get Started',
                onPressed: () {
                  pageIndex == onBoardingList.length - 1
                      ? Navigator.of(context).pushNamed(LoginScreen.routeName)
                      : controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                },
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(50)),
        ],
      ),
    );
  }
}
