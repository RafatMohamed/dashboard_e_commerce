import 'package:dashboard_e_commerce_food/features/Home/View/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title:
            Text("Dashboard E-Commerce Food",style: TextStyles.bold16.copyWith(color: AppColor.grayscale950),),
      ),
      body: const SafeArea(child: HomeViewBody(),),
    );
  }
}
