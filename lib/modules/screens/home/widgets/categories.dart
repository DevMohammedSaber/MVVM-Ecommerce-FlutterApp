import 'package:e_commerce_app_api_cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/constant/size_config.dart';
import '../../products_of_category/product_ofcategory_screen.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            4,
            (index) => CategoryCard(
              image: cubit.categoriesList[index].image!,
              name: cubit.categoriesList[index].name!,
              press: () {
                Navigator.of(context).pushNamed(
                  ProductOfCategoryScreen.routeName,
                  arguments: {
                    'id': cubit.categoriesList[index].id,
                    'name': cubit.categoriesList[index].name,
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.image,
    required this.name,
    required this.press,
  }) : super(key: key);

  final String image, name;
  final void Function() press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(65),
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(65),
              width: getProportionateScreenWidth(65),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
