// // import 'dart:io';
// //
// // class ProductModel {
// //   final String name;
// // final String price;
// // final String description;
// // final String code;
// // final bool isFeatured;
// // final String quantity;
// // final File image;
// //  String? imagePath;
// //
// //
// //   ProductModel({
// //     required this.name,
// //     required this.image,
// //     required this.price,
// //     required this.description,
// //     required this.code,
// //     required this.isFeatured,
// //     required this.quantity,
// //     this.imagePath
// //   });
// //
// //   factory ProductModel.fromJson(Map<String, dynamic> json) {
// //     return ProductModel(
// //       name: json['name'],
// //       image: json['image'],
// //       price: json['price'],
// //       description: json['description'],
// //       code: json['code'],
// //       isFeatured: json['isFeatured'],
// //       quantity: json['quantity'],
// //       imagePath: json['imagePath'],
// //     );
// //   }
// //
// // }
// // class ProductModelInitial{
// //   final String name;
// // final String price;
// // final String description;
// // final String code;
// // final bool isFeatured;
// // final String quantity;
// // final File image;
// //  String? imagePath;
// //
// //
// //   ProductModelInitial({
// //     required this.name,
// //     required this.image,
// //     required this.price,
// //     required this.description,
// //     required this.code,
// //     required this.isFeatured,
// //     required this.quantity,
// //     this.imagePath
// //   });
// //
// //   factory ProductModelInitial.fromEntity(ProductModel productModel) {
// //     return ProductModelInitial(
// //       name: productModel.name,
// //       image: productModel.image,
// //       price: productModel.price,
// //       description: productModel.description,
// //       code: productModel.code,
// //       isFeatured: productModel.isFeatured,
// //       quantity: productModel.quantity,
// //       imagePath: productModel.imagePath,
// //     );
// //   }
// //   toJson(){
// //     return {
// //       'name':name,
// //       'image':image,
// //       'price':price,
// //       'description':description,
// //       'code':code,
// //       'isFeatured':isFeatured,
// //       'quantity':quantity,
// //       'imagePath':imagePath,
// //     };
// //   }
// // }
// import 'dart:io';
//
// class ProductModel {
//   final String name;
//   final String price;
//   final String description;
//   final String code;
//   final bool isFeatured;
//   final String quantity;
//   final File image;
//   String? imagePath;
//
//   ProductModel({
//     required this.name,
//     required this.image,
//     required this.price,
//     required this.description,
//     required this.code,
//     required this.isFeatured,
//     required this.quantity,
//     this.imagePath,
//   });
//
//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       name: json['name'],
//       image: File(''), // placeholder, actual image should not be in JSON
//       price: json['price'],
//       description: json['description'],
//       code: json['code'],
//       isFeatured: json['isFeatured'],
//       quantity: json['quantity'],
//       imagePath: json['imagePath'],
//     );
//   }
// }
//
// class ProductModelInitial {
//   final String name;
//   final String price;
//   final String description;
//   final String code;
//   final bool isFeatured;
//   final String quantity;
//   final File image;
//   String? imagePath;
//
//   ProductModelInitial({
//     required this.name,
//     required this.image,
//     required this.price,
//     required this.description,
//     required this.code,
//     required this.isFeatured,
//     required this.quantity,
//     this.imagePath,
//   });
//
//   factory ProductModelInitial.fromEntity(ProductModel productModel) {
//     return ProductModelInitial(
//       name: productModel.name,
//       image: productModel.image,
//       price: productModel.price,
//       description: productModel.description,
//       code: productModel.code,
//       isFeatured: productModel.isFeatured,
//       quantity: productModel.quantity,
//       imagePath: productModel.imagePath,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'price': price,
//       'description': description,
//       'code': code,
//       'isFeatured': isFeatured,
//       'quantity': quantity,
//       'imagePath': imagePath,
//     };
//   }
// }
import 'dart:io';

class ProductModel {
  final String name;
  final String price;
  final String description;
  final String code;
  final bool isFeatured;
  final String quantity;
  final File image;
  String? imagePath; // This will be filled after image upload

  ProductModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.code,
    required this.isFeatured,
    required this.quantity,
    this.imagePath,
  });

  // Note: Don't deserialize File from JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      image: File(''), // Placeholder (can't store/recover File from JSON)
      price: json['price'],
      description: json['description'],
      code: json['code'],
      isFeatured: json['isFeatured'],
      quantity: json['quantity'],
      imagePath: json['imagePath'],
    );
  }
}

class ProductModelInitial {
  final String name;
  final String price;
  final String description;
  final String code;
  final bool isFeatured;
  final String quantity;
  final String? imagePath;

  ProductModelInitial({
    required this.name,
    required this.price,
    required this.description,
    required this.code,
    required this.isFeatured,
    required this.quantity,
    this.imagePath,
  });

  factory ProductModelInitial.fromEntity(ProductModel productModel) {
    return ProductModelInitial(
      name: productModel.name,
      price: productModel.price,
      description: productModel.description,
      code: productModel.code,
      isFeatured: productModel.isFeatured,
      quantity: productModel.quantity,
      imagePath: productModel.imagePath,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'description': description,
      'code': code,
      'isFeatured': isFeatured,
      'quantity': quantity,
      'imagePath': imagePath,
    };
  }
}

