import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dashboard_e_commerce_food/core/Data/Repo/FileUploadImage/upload_image.dart';
import 'package:dashboard_e_commerce_food/core/service/cloudStorageService/cloud_service.dart';

import '../../../const.dart';

class UploadImageImp implements UploadImageRepo {

  final CloudService cloudService;
  UploadImageImp({required this.cloudService});

  @override
  Future<Either<String, String>> uploadImage({required File image}) async {
    try {
      String urlImage = await cloudService.uploadFile(file: image, fileName: EndPoints.filePathImages);
      return right(urlImage);
    } catch (e) {
      return Left('Failed to upload image: $e');
    }
  }
}