import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app_api_cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
        return CarouselSlider(
          items: List.generate(
            cubit.bannersList.length,
            (index) => Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF4A3298),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  cubit.bannersList[index].image!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          options: CarouselOptions(
            height: 180,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            // onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
