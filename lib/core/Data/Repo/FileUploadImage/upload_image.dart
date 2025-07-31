import 'dart:io';
import 'package:dartz/dartz.dart';

abstract class UploadImageRepo {
  Future<Either<String, String>> uploadImage({required File image});
}