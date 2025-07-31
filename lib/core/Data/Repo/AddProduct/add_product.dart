import 'package:dartz/dartz.dart';

import '../../Model/product_model.dart';

abstract class AddProductRepo {
  Future<Either<String, void>> addProduct({required ProductModel productModel});
}