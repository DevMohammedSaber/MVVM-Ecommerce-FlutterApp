import 'package:e_commerce_app_api_cubit/layout/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app_api_cubit/models/product_model.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/cart/cart_screen.dart';
import 'package:e_commerce_app_api_cubit/modules/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconBtnWithCounter(
          svgSrc: "assets/icons/search.svg",
          press: () {
            showSearch(context: context, delegate: DataSrearch());
          },
        ),
        const Spacer(),
        IconBtnWithCounter(
          svgSrc: "assets/icons/Cart Icon.svg",
          press: () => Navigator.pushNamed(context, CartScreen.routeName),
        ),
        IconBtnWithCounter(
          svgSrc: "assets/icons/Bell.svg",
          numOfitem: 3,
          press: () {},
        ),
      ],
    );
  }
}

class DataSrearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
    List<ProductModel> filterdList = cubit.productsList
        .where((element) =>
            element.name!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: query == '' ? 5 : filterdList.length,
      itemBuilder: (context, index) {
        return query == ''
            ? InkWell(
                onTap: () {
                  close(context, null);
                  Navigator.of(context).pushNamed(DetailsScreen.routeName,
                      arguments: cubit.productsList[index]);
                },
                child: ListTile(
                  title: Text(cubit.productsList[index].name!),
                  subtitle: Text(cubit.productsList[index].price!.toString()),
                  trailing: Image.network(cubit.productsList[index].images![0]),
                ),
              )
            : InkWell(
                onTap: () {
                  close(context, null);
                  Navigator.of(context).pushNamed(DetailsScreen.routeName,
                      arguments: filterdList[index]);
                },
                child: ListTile(
                  title: Text(filterdList[index].name!),
                  subtitle: Text('${filterdList[index].price!.toString()} \$'),
                  trailing: Image.network(filterdList[index].images![0]),
                ),
              );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    LayoutCubit cubit = BlocProvider.of<LayoutCubit>(context);
    List<ProductModel> filterdList = cubit.productsList
        .where((element) =>
            element.name!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: query == '' ? 5 : filterdList.length,
      itemBuilder: (context, index) {
        return query == ''
            ? InkWell(
                onTap: () {
                  close(context, null);
                  Navigator.of(context).pushNamed(DetailsScreen.routeName,
                      arguments: cubit.productsList[index]);
                },
                child: ListTile(
                  title: Text(cubit.productsList[index].name!),
                  subtitle: Text(cubit.productsList[index].price!.toString()),
                  trailing: Image.network(cubit.productsList[index].images![0]),
                ),
              )
            : InkWell(
                onTap: () {
                  close(context, null);
                  Navigator.of(context).pushNamed(DetailsScreen.routeName,
                      arguments: filterdList[index]);
                },
                child: ListTile(
                  title: Text(filterdList[index].name!),
                  subtitle: Text('${filterdList[index].price!.toString()} \$'),
                  trailing: Image.network(filterdList[index].images![0]),
                ),
              );
      },
    );
  }
}

//