import 'package:dashboard_e_commerce_food/core/Data/Repo/FileUploadImage/upload_image.dart';
import 'package:dashboard_e_commerce_food/features/Add_product/View/widgets/add_product_view_body.dart';
import 'package:dashboard_e_commerce_food/features/Add_product/logic/add_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/Data/Repo/AddProduct/add_product.dart';
import '../../../core/service/get_it.dart';
import '../../../core/widgets/custom_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const String routeName = "AddProductView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Add Product"),
      body: SafeArea(child: BlocProvider(
        create: (context) => AddProductCubit(uploadImageRepo: getIt<UploadImageRepo>(), addProductRepo: getIt<AddProductRepo>()),
        child: const AddProductViewBody(),
      ),),
    );
  }
}
