part of 'layout_cubit.dart';

abstract class LayoutStates {}

final class LayoutInitialState extends LayoutStates {}

final class GetUserDataLoadingState extends LayoutStates {}

final class GetUserDataFailureState extends LayoutStates {
  String error;
  GetUserDataFailureState({required this.error});
}

final class GetUserDataSuccessState extends LayoutStates {}
////////////////////////////////////////////////////////////

final class GetBannersLoadingState extends LayoutStates {}

final class GetBannersFailureState extends LayoutStates {
  String error;
  GetBannersFailureState({required this.error});
}

final class GetBannersSuccessState extends LayoutStates {}

///////////////////////////////////////////////////////////
final class GetCategoriesLoadingState extends LayoutStates {}

final class GetCategoriesFailureState extends LayoutStates {
  String error;
  GetCategoriesFailureState({required this.error});
}

final class GetCategoriesSuccessState extends LayoutStates {}
///////////////////////////////////////////////////////////

final class GetProductsLoadingState extends LayoutStates {}

final class GetProductsFailureState extends LayoutStates {
  String error;
  GetProductsFailureState({required this.error});
}

final class GetProductsSuccessState extends LayoutStates {}
///////////////////////////////////////////////////////////

final class GetProductsOfCategoryLoadingState extends LayoutStates {}

final class GetProductsOfCategoryFailureState extends LayoutStates {
  String error;
  GetProductsOfCategoryFailureState({required this.error});
}

final class GetProductsOfCategorySuccessState extends LayoutStates {}

///////////////////////////////////////////////////////////
final class GetFilterdProductsSuccessState extends LayoutStates {}

///////////////////////////////////////////////////////////
final class GetFavouritesSuccessState extends LayoutStates {}

final class GetFavouritesFaliureState extends LayoutStates {
  String error;
  GetFavouritesFaliureState({required this.error});
}
//////////////////////////////////////////////////////////

final class AddOrRemoveFavouritesSuccessState extends LayoutStates {}

final class AddOrRemoveFavouritesFaliureState extends LayoutStates {
  String error;
  AddOrRemoveFavouritesFaliureState({required this.error});
}

///////////////////////////////////////////////////////////
final class GetCartSuccessState extends LayoutStates {}

final class GetCartFaliureState extends LayoutStates {
  String error;
  GetCartFaliureState({required this.error});
}
//////////////////////////////////////////////////////////

final class AddToCartSuccessState extends LayoutStates {}

final class AddToCartFaliureState extends LayoutStates {
  String error;
  AddToCartFaliureState({required this.error});
}

//////////////////////////////////////////////////////////
final class UpdateProfileLoadingState extends LayoutStates {}

final class UpdateProfileSuccessState extends LayoutStates {}

final class UpdateProfileFaliureState extends LayoutStates {
  String error;
  UpdateProfileFaliureState({required this.error});
}
