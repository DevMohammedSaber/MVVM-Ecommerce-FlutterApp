import 'package:e_commerce_app_api_cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/products_of_category/product_ofcategory_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/constant/size_config.dart';

class CategoryScreenBody extends StatelessWidget {
  const CategoryScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
    return cubit.categoriesList.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: GridView.builder(
              itemCount: cubit.categoriesList.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 5,
                mainAxisSpacing: getProportionateScreenHeight(20),
                crossAxisSpacing: getProportionateScreenWidth(20),
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ProductOfCategoryScreen.routeName,
                      arguments: {
                        'id': cubit.categoriesList[index].id,
                        'name': cubit.categoriesList[index].name,
                      },
                    );
                  },
                  child: CustomCartItemWidget(
                    productName: cubit.categoriesList[index].name!,
                    productImage: cubit.categoriesList[index].image!,
                  ),
                );
              },
            ),
          );
  }
}

class CustomCartItemWidget extends StatelessWidget {
  const CustomCartItemWidget({
    super.key,
    required this.productName,
    required this.productImage,
  });
  final String productName;
  final String productImage;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          children: [
            Container(
              width: getProportionateScreenWidth(150),
              height: getProportionateScreenHeight(115),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  image: NetworkImage(productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Container(
              constraints: const BoxConstraints(maxHeight: 42),
              child: Text(
                productName,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
