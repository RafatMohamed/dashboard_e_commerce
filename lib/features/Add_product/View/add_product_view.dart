import 'package:dashboard_e_commerce_food/features/Add_product/View/widgets/add_product_view_body.dart';
import 'package:dashboard_e_commerce_food/features/Home/View/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const String routeName = "AddProductView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "Add Product"),
      body: SafeArea(child: AddProductViewBody(),),
    );
  }
}
