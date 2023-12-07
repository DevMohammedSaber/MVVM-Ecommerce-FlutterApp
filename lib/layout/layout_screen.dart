import 'package:e_commerce_app_api_cubit/modules/screens/cart/cart_screen.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/favourite/favourite_screen.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/home/home_screen.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../shared/constant/colors.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});
  static const routeName = 'layoutScreen';

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectedIndex),
      bottomNavigationBar: StylishBottomBar(
        option: BubbleBarOptions(
          // barStyle: BubbleBarStyle.vertical,
          barStyle: BubbleBarStyle.horizotnal,
          bubbleFillStyle: BubbleFillStyle.fill,
          // bubbleFillStyle: BubbleFillStyle.outlined,
          opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            backgroundColor: kPrimaryColor,
            // badge: const Badge(),
            // showBadge: true,
          ),
          BottomBarItem(
            icon: const Icon(Icons.favorite_outline_outlined),
            title: const Text('Like'),
            backgroundColor: kPrimaryColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.shopping_cart_outlined),
            title: const Text('Cart'),
            backgroundColor: kPrimaryColor,
          ),
          BottomBarItem(
            icon: const Icon(Icons.account_circle_outlined),
            title: const Text('Profile'),
            backgroundColor: kPrimaryColor,
          ),
        ],
        // fabLocation: StylishBarFabLocation.end,
        // hasNotch: true,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
