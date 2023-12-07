import 'package:e_commerce_app_api_cubit/models/product_model.dart';

class Cart {
  final ProductModel product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}
