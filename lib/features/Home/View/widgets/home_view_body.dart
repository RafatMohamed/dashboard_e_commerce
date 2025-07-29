

import 'package:dashboard_e_commerce_food/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../Add_product/View/add_product_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context)  {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: CustomButton(text: "Add Product", onTap: (){
          Navigator.pushNamed(context, AddProductView.routeName);
        }),
      ),
    );
  }
}


