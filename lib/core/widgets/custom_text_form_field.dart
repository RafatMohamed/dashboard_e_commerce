import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.controller,
    required this.onSaved,
    required this.textInputAction,
    this.maxLines=1,
  });
  final int? maxLines;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
           Colors.black.withValues(alpha: 0.7),
           const Color(0xffF9FAFA),
        ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
      ),
      child: TextFormField(
        autofocus: false,
        validator: (value) {
          if(value==null || value.isEmpty){
            return "Please enter some text";
          }
          return null;
        },
        maxLines: maxLines,
        scrollPhysics: const BouncingScrollPhysics(),
        style: TextStyles.semiBold16.copyWith(color: AppColor.grayscale950),
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        controller: controller,
        onSaved:onSaved ,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyles.bold13.copyWith(color: AppColor.green1500),
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          disabledBorder: buildOutlineInputBorder(),
          enabled: true,
          focusedBorder: buildOutlineInputBorder(),
          errorBorder:buildOutlineInputBorder(),
          focusedErrorBorder: buildOutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        strokeAlign: BorderSide.strokeAlignCenter,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
