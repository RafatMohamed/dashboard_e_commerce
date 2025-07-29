import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shadows: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        scrollPhysics: const BouncingScrollPhysics(),
        style: TextStyles.semiBold16.copyWith(color: AppColor.grayscale950),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.start,
        controller: TextEditingController(),
        onSaved:(newValue) {} ,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Icon(Icons.filter_list_outlined),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(10.0),
            child: const Icon(Icons.search_outlined),
          ),
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: 'ابحث عن ما تريد',
          hintTextDirection:TextDirection.rtl,
          hintStyle: TextStyles.bold13.copyWith(color: AppColor.grayscale400),
      ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.transparent),
      );
  }
}
