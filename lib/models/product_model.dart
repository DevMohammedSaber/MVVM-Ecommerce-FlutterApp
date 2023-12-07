import 'package:flutter/material.dart';

class ProductModel {
  int? id;
  String? name, description, image;
  List<dynamic>? images;
  int? price, oldPrice, discount;
  bool? isFavourite, inCart;

  ProductModel({
    this.oldPrice,
    this.discount,
    this.id,
    this.images,
    this.isFavourite = false,
    this.inCart = false,
    this.name,
    this.price,
    this.description,
    this.image,
  });

  ProductModel.fromJson({required Map<String, dynamic> data}) {
    id = data['id'].toInt();
    name = data['name'].toString();
    description = data['description'].toString();
    price = data['price'].toInt();
    oldPrice = data['old_price'].toInt();
    discount = data['discount'].toInt();
    images = data['images'];
    isFavourite = data['in_favorites'];
    inCart = data['in_cart'];
    image = data['image'];
  }
  List<Color> colors = [
    Color(0xFFF6625E),
    Color(0xFF836DB8),
    Color(0xFFDECB9C),
    Colors.white,
  ];
}

// Our demo Products

// List<Product> demoProducts = [
//   Product(
//     id: 1,
//     images: [
//       "assets/images/ps4_console_white_1.png",
//       "assets/images/ps4_console_white_2.png",
//       "assets/images/ps4_console_white_3.png",
//       "assets/images/ps4_console_white_4.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     name: "Wireless Controller for PS4™",
//     price: 64.99,
//     description: description,
//     rating: 4.8,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 2,
//     images: [
//       "assets/images/Image Popular Product 2.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     name: "Nike Sport White - Man Pant",
//     price: 50.5,
//     description: description,
//     rating: 4.1,
//     isPopular: true,
//   ),
//   Product(
//     id: 3,
//     images: [
//       "assets/images/glap.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     name: "Gloves XC Omega - Polygon",
//     price: 36.55,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//     isPopular: true,
//   ),
//   Product(
//     id: 4,
//     images: [
//       "assets/images/wireless headset.png",
//     ],
//     colors: [
//       Color(0xFFF6625E),
//       Color(0xFF836DB8),
//       Color(0xFFDECB9C),
//       Colors.white,
//     ],
//     name: "Logitech Head",
//     price: 20.20,
//     description: description,
//     rating: 4.1,
//     isFavourite: true,
//   ),
// ];

// const String description =
//     "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
