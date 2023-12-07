import 'package:e_commerce_app_api_cubit/modules/screens/favourite/widgets/favourites_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../layout/layout_cubit/layout_cubit.dart';
import '../../../../shared/constant/colors.dart';
import '../../../../shared/constant/size_config.dart';
import 'package:lottie/lottie.dart';

class FavouriteScreenBody extends StatelessWidget {
  const FavouriteScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return cubit.favouritesList.isEmpty
            ? Center(
                child: Lottie.asset('assets/lottie/empty.json', repeat: false))
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10),
                    vertical: getProportionateScreenHeight(10)),
                child: ListView.separated(
                  itemCount: cubit.favouritesList.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: kGreyShade1,
                      height: 50,
                    );
                  },
                  itemBuilder: (context, index) {
                    return FavouritesCard(product: cubit.favouritesList[index]);
                  },
                ),
              );
      },
    );
  }
}
