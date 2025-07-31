import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dashboard_e_commerce_food/core/Data/Model/product_model.dart';
import 'package:dashboard_e_commerce_food/core/Data/Repo/AddProduct/add_product.dart';
import 'package:dashboard_e_commerce_food/core/service/FireBaseService/Fire_base_service.dart';
import '../../../const.dart';

class AddProductImp implements AddProductRepo {

  final FireBaseService fireBaseService;

  AddProductImp({required this.fireBaseService});

  @override
  Future<Either<String, void>> addProduct({required ProductModel productModel}) async {
    try {
      var data = ProductModelInitial.fromEntity(productModel).toJson();
      await fireBaseService.addData(collectionName: EndPoints.productCollection, path: productModel.code, data: data);
      return right(null);
    }
    catch (e) {
      log("Failed When i add Product ${e.toString()}");
      return Left("Failed When i add Product ${e.toString()}");
    }
  }

 Future<Either<String, Map<String, dynamic>>> getProduct({required ProductModel productModel}) async {
    try {
      var data = await fireBaseService.getData(collectionName: EndPoints.productCollection, path: productModel.code);
      return right(data!);
    }
    catch (e) {
      return Left("Failed When i get Product ${e.toString()}");
    }
  }
}