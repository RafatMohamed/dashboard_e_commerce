import 'package:dashboard_e_commerce_food/core/Data/Repo/AddProduct/add_product.dart';
import 'package:dashboard_e_commerce_food/core/Data/Repo/AddProduct/add_product_imp.dart';
import 'package:dashboard_e_commerce_food/core/Data/Repo/FileUploadImage/upload_image.dart';
import 'package:dashboard_e_commerce_food/core/Data/Repo/FileUploadImage/upload_image_imp.dart';
import 'package:dashboard_e_commerce_food/core/service/FireBaseService/Fire_base_service.dart';
import 'package:dashboard_e_commerce_food/core/service/FireBaseService/fire_store_service.dart';
import 'package:dashboard_e_commerce_food/core/service/StorageFireStore/upload_file.dart';
import 'package:get_it/get_it.dart';

import 'cloudStorageService/cloud_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CloudService>(FirebaseStorageService());
  getIt.registerSingleton<FireBaseService>(FireStoreService());
  getIt.registerSingleton<UploadImageRepo>(UploadImageImp(cloudService: getIt<CloudService>()));
  getIt.registerSingleton<AddProductRepo>(AddProductImp(fireBaseService: getIt<FireBaseService>()));
}
