import '../../../../shared/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../../../shared/constant/size_config.dart';

class IndicatorPageView extends StatelessWidget {
  const IndicatorPageView({
    super.key,
    required this.pageIndex,
  });
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
