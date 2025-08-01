import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import 'custom_arrow_back_w.dart';

AppBar customAppBar({required BuildContext context, required String title}) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    leading:          CustomArrowBackW(
      onTap: () {
        Navigator.pop(context);
      },
    ),
    title: Text(title,style: TextStyles.bold16.copyWith(color: AppColor.grayscale950),),
  );
}
