import 'package:e_commerce_app_api_cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app_api_cubit/modules/widgets/product_card.dart';
import 'package:e_commerce_app_api_cubit/shared/constant/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductOfCategoryBody extends StatelessWidget {
  const ProductOfCategoryBody({super.key, required this.categoryId});
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LayoutCubit()..getProductsOfCategory(categoryid: categoryId),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
          return cubit.productsOfCategoryList.isNotEmpty
              ? Container(
                  width: SizeConfig.screenWidth,
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: getProportionateScreenWidth(20),
                      mainAxisSpacing: getProportionateScreenHeight(20),
                    ),
                    itemCount: cubit.productsOfCategoryList.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: cubit.productsOfCategoryList[index],
                      );
                    },
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

// class MyAccountItem extends StatelessWidget {
//   const MyAccountItem({
//     super.key,
//     required this.content,
//     required this.title,
//   });

//   final String content;
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: getProportionateScreenHeight(50),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: const Color(0xFFF5F6F9),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(width: getProportionateScreenWidth(20)),
//           Text(
//             title,
//             style: const TextStyle(
//                 color: kPrimaryColor,
//                 fontSize: 15,
//                 fontWeight: FontWeight.w900),
//           ),
//           SizedBox(width: getProportionateScreenWidth(20)),
//           Expanded(
//             child: Text(
//               content,
//               style: const TextStyle(color: kPrimaryColor, fontSize: 20),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
