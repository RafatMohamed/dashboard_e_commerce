import 'dart:io';

import '../../Data/Model/product_model.dart';
abstract class CloudService {
  Future<String> uploadFile({required File file, required String fileName});

  Future <void> addProductImage({required ProductModel productModel});
}
