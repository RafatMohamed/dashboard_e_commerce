import 'package:dashboard_e_commerce_food/core/Data/Repo/AddProduct/add_product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Data/Model/product_model.dart';
import '../../../core/Data/Repo/FileUploadImage/upload_image.dart';
import 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.uploadImageRepo, required this.addProductRepo})
    : super(AddProductInitial());
  final UploadImageRepo uploadImageRepo;
  final AddProductRepo addProductRepo;

  Future <void> addProduct({
    required ProductModel productModel,
  }) async {
    try {
      emit(AddProductLoading());
      final resultImage = await uploadImageRepo.uploadImage(
        image: productModel.image,
      );
      resultImage.fold(
            (l) {
          return emit(AddProductError(message: l));
        },
            (urlImage) async {
          productModel.imagePath = urlImage;
          if (productModel.imagePath == null) {
            emit(AddProductError(message: "Image not selected."));
            return;
          }
          final resultProduct = await addProductRepo.addProduct(
            productModel: productModel,
          );
          resultProduct.fold(
                (l) {
              return emit(AddProductError(message: l));
            },
                (r) {
              return emit(AddProductSuccess());
            },
          );
        },
      );
    }catch (e) {
      emit(AddProductError(message: e.toString()));
    }
  }
}
