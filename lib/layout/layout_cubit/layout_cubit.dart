import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app_api_cubit/models/banner_model.dart';
import 'package:e_commerce_app_api_cubit/models/category_model.dart';
import 'package:e_commerce_app_api_cubit/models/product_model.dart';
import 'package:e_commerce_app_api_cubit/models/user_model.dart';
import 'package:e_commerce_app_api_cubit/shared/network/sharedpreferences_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  String token = SharedpreferencesService.getData(key: 'token');

  int pageIndex = 0;
  final PageController controller = PageController();

  onboardingGetPageIndex(int index) {
    pageIndex = index;
  }

  onboardingNextPage() {
    controller.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  UserModel? userModel;
  void getUserData() async {
    emit(GetUserDataLoadingState());
    try {
      http.Response response = await http.get(
          Uri.parse('https://student.valuxapps.com/api/profile'),
          headers: {
            'Authorization': token,
            'lang': 'en',
          });
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        userModel = UserModel.fromJson(data: responseData['data']);

        emit(GetUserDataSuccessState());
      } else {
        emit(GetUserDataFailureState(
          error: responseData['message'],
        ));
      }
    } on Exception catch (e) {
      emit(GetUserDataFailureState(error: e.toString()));
    }
  }

  List<BannerModel> bannersList = [];
  getBannerData() async {
    emit(GetBannersLoadingState());
    try {
      http.Response response = await http
          .get(Uri.parse('https://student.valuxapps.com/api/banners'));
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        for (var item in responseData['data']) {
          bannersList.add(BannerModel.fromJson(data: item));
        }
        emit(GetBannersSuccessState());
      } else {
        emit(GetBannersFailureState(
          error: responseData['message'],
        ));
      }
    } on Exception catch (e) {
      emit(GetBannersFailureState(error: e.toString()));
    }
    print('token : $token');
  }

  List<CategoryModel> categoriesList = [];
  getCategoriesData() async {
    emit(GetCategoriesLoadingState());
    try {
      http.Response response = await http.get(
          Uri.parse('https://student.valuxapps.com/api/categories'),
          headers: {'lang': 'en'});
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        for (var item in responseData['data']['data']) {
          categoriesList.add(CategoryModel.fromJson(data: item));
        }
        emit(GetCategoriesSuccessState());
      } else {
        emit(GetCategoriesFailureState(
          error: responseData['message'],
        ));
      }
    } on Exception catch (e) {
      emit(GetCategoriesFailureState(error: e.toString()));
    }
  }

  List<ProductModel> productsList = [];

  getProductsData() async {
    emit(GetProductsLoadingState());
    try {
      http.Response response = await http
          .get(Uri.parse('https://student.valuxapps.com/api/home'), headers: {
        'Authorization': token,
        'lang': 'en',
      });

      var responseData = jsonDecode(response.body);

      if (responseData['status'] == true) {
        emit(GetProductsSuccessState());
        for (var item in responseData['data']['products']) {
          productsList.add(ProductModel.fromJson(data: item));
        }
      } else {
        emit(GetProductsFailureState(error: responseData['message']));
      }
    } on Exception catch (e) {
      emit(GetProductsFailureState(error: e.toString()));
    }
  }

  List<ProductModel> productsOfCategoryList = [];
  getProductsOfCategory({required int categoryid}) async {
    emit(GetProductsOfCategoryLoadingState());
    try {
      http.Response response = await http.get(
          Uri.parse('https://student.valuxapps.com/api/categories/$categoryid'),
          headers: {
            'lang': 'en',
          });

      var responseData = jsonDecode(response.body);

      if (responseData['status'] == true) {
        emit(GetProductsOfCategorySuccessState());
        for (var item in responseData['data']['data']) {
          productsOfCategoryList.add(ProductModel.fromJson(data: item));
        }
      } else {
        emit(GetProductsOfCategoryFailureState(error: responseData['message']));
      }
    } on Exception catch (e) {
      emit(GetProductsOfCategoryFailureState(error: e.toString()));
    }
  }

  List<ProductModel> favouritesList = [];
  Set<String> favouriteId = {};
  getFavourites() async {
    favouritesList.clear();
    try {
      http.Response response = await http.get(
          Uri.parse('https://student.valuxapps.com/api/favorites'),
          headers: {
            'lang': 'en',
            'Authorization': token,
          });
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        for (var item in responseData['data']['data']) {
          favouritesList.add(ProductModel.fromJson(data: item['product']));
          favouriteId.add(item['product']['id'].toString());
          emit(GetFavouritesSuccessState());
        }
      } else {
        emit(GetFavouritesFaliureState(error: responseData['message']));
      }
    } on Exception catch (e) {
      emit(GetFavouritesFaliureState(error: e.toString()));
    }
  }

  addOrRemoveFromFavourites({required String id}) async {
    if (favouriteId.contains(id) == true) {
      favouriteId.remove(id);
    } else {
      favouriteId.add(id);
    }
    try {
      http.Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/favorites'),
        headers: {
          'lang': 'en',
          'Authorization': token,
        },
        body: {
          'product_id': id,
        },
      );
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        await getFavourites();
        // await getProductsData();
        emit(AddOrRemoveFavouritesSuccessState());
      } else {
        emit(AddOrRemoveFavouritesFaliureState(error: responseData['message']));
      }
    } on Exception catch (e) {
      emit(AddOrRemoveFavouritesFaliureState(error: e.toString()));
    }
  }

  List<ProductModel> cartList = [];
  String totalPrice = '';
  Set<String> cartId = {};
  getCartItems() async {
    cartList.clear();
    try {
      http.Response response = await http
          .get(Uri.parse('https://student.valuxapps.com/api/carts'), headers: {
        'lang': 'en',
        'Authorization': token,
      });
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        totalPrice = responseData['data']['total'].toString();
        for (var item in responseData['data']['cart_items']) {
          cartList.add(ProductModel.fromJson(data: item['product']));
          cartId.add(item['product']['id'].toString());
          emit(GetCartSuccessState());
        }
      } else {
        emit(GetCartFaliureState(error: responseData['message']));
      }
    } on Exception catch (e) {
      emit(GetCartFaliureState(error: e.toString()));
    }
  }

  addOrRemoveFromCart({required String id}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://student.valuxapps.com/api/carts'),
        headers: {
          'lang': 'en',
          'Authorization': token,
        },
        body: {
          'product_id': id,
        },
      );
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        cartId.add(id);
        await getCartItems();
        // await getProductsData();
        emit(AddToCartSuccessState());
      } else {
        emit(AddToCartFaliureState(error: responseData['message']));
      }
    } on Exception catch (e) {
      emit(AddToCartFaliureState(error: e.toString()));
    }
  }

  void updateProfiel(
      {required String name,
      required String email,
      required String phone}) async {
    emit(UpdateProfileLoadingState());
    try {
      http.Response response = await http.put(
          Uri.parse('https://student.valuxapps.com/api/update-profile'),
          headers: {
            'lang': 'en',
            'Authorization': token,
          },
          body: {
            'name': name,
            'phone': phone,
            'email': email,
          });
      var responseData = jsonDecode(response.body);
      if (responseData['status'] == true) {
        getUserData();
        emit(UpdateProfileSuccessState());
      } else {
        emit(UpdateProfileFaliureState(error: responseData['message']));
      }
    } on Exception catch (e) {
      emit(UpdateProfileFaliureState(error: e.toString()));
    }
  }
}
