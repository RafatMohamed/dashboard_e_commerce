import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';
import '../utils/images.dart';

class CustomCategoryProduct extends StatelessWidget {
  const CustomCategoryProduct({
    super.key, this.onTapFavorite, this.onTapCartAdd, required this.image, required this.title, required this.price,
  });
  final Function()? onTapFavorite;
  final Function()? onTapCartAdd;
  final String image;
  final String title;
  final double price;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
        children:[
          Container(
            padding: const EdgeInsetsDirectional.only(top: 8,end: 10,bottom:20,start: 10),
            width: size.width * 0.45,
            decoration: ShapeDecoration(
              color: const Color(0xFFF3F5F7),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              shadows: const [
                BoxShadow(
                  color: Color(0xFFF3F5E0),
                  blurRadius: 9,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: const ShapeDecoration(
                      color: Colors.transparent,
                      shape: OvalBorder(),
                    ),
                    child: Center(
                      child:IconButton(
                        onPressed: onTapFavorite,
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.favorite_border),
                        color: Colors.black,
                        alignment: AlignmentDirectional.center,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      width: 36,
                      height: 36,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF1B5E37) /* Green1-500 */,
                        shape: OvalBorder(),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: onTapCartAdd,
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.add,color: Colors.white,),
                          alignment: AlignmentDirectional.center,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(title, textAlign: TextAlign.end,style: TextStyles.semiBold13.copyWith(color: AppColor.grayscale950),),
                        const SizedBox(height: 4,),
                        Row(
                          children: [
                            Text("$priceجنية/",textAlign: TextAlign.end, style: TextStyles.bold13.copyWith(color: AppColor.orange500),),
                            Text(" الكيلو", textAlign: TextAlign.start,style: TextStyles.bold13.copyWith(color: AppColor.orange400),),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 120,
            left: 30,
            right: 50,
            child: Image.asset(Assets.oval,fit: BoxFit.fill,height: 50,color: Colors.grey.shade400.withValues(alpha: 0.5),),
          ),
          Positioned(
            top: 50,
            left: 16,
            child: Image.asset(image,fit: BoxFit.scaleDown,width: 130,height: 100,),
          ),
        ]
    );
  }
}