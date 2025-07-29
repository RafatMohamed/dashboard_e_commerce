import 'dart:developer';
import 'dart:io';

import 'package:dashboard_e_commerce_food/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/default_check_box.dart';
import '../test.dart';

class AddProductViewBody extends StatefulWidget {
  AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController productNameController = TextEditingController();

  final TextEditingController productPriceController = TextEditingController();

  final TextEditingController productQuantityController = TextEditingController();

  final TextEditingController productDescriptionController = TextEditingController();

  final TextEditingController productCodeController = TextEditingController();


  bool isCheckFeature = false;
   File? imagePath;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode:autovalidateMode ,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            // name
            CustomTextFormField(
              hintText: 'Add Product Name',
              keyboardType: TextInputType.name,
              controller: productNameController,
              textInputAction: TextInputAction.next,
              onSaved: (p0) {
                productNameController.text = p0!;
              },
            ),
            // price
            CustomTextFormField(
              hintText: 'Add Product Price',
              controller: productPriceController,
              textInputAction: TextInputAction.next,
              onSaved: (p0) {
                productPriceController.text = p0!;
              },
              keyboardType: TextInputType.number,
            ),
            // quantity
            CustomTextFormField(
              controller: productQuantityController,
              textInputAction: TextInputAction.next,
              onSaved: (p0) {
                productQuantityController.text = p0!;
              },
              keyboardType: TextInputType.number,
              hintText: 'Add Product Quantity',
            ),
            // code
            CustomTextFormField(
              controller: productCodeController,
              textInputAction: TextInputAction.next,
              onSaved: (p0) {
                productCodeController.text = p0!.toLowerCase();
              },
              keyboardType: TextInputType.text,
              hintText: 'Add Product Code',
            ),
            // description
            CustomTextFormField(
              hintText: 'Add Product Description',
              controller: productDescriptionController,
              textInputAction: TextInputAction.done,
              onSaved: (p0) {
                productDescriptionController.text = p0!;
              },
              keyboardType: TextInputType.text,
              maxLines: 4,
            ),
            // image
            CustomPickerImage(
              pickerImage: (p0) async {
                imagePath = p0;
                setState(() {});
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DefaultCheckBox(
                  isChecked: isCheckFeature,
                  onChanged: (value) {
                    setState(() {
                      isCheckFeature = value;
                    });
                    log(isCheckFeature.toString());
                  },
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                          "is Featured product?",
                          style: TextStyles.semiBold16.copyWith(
                            color: AppColor.grayscale400,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            CustomButton(text: "Add Product", onTap: () {
              if(_formKey.currentState!.validate() && imagePath != null){
                _formKey.currentState!.save();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TestAddProductView(
                    code: productCodeController.text,
                    description: productDescriptionController.text,
                    name: productNameController.text,
                    price: productPriceController.text,
                    quantity: productQuantityController.text,
                    image: imagePath!,
                    category: "",
                    isFeatured: isCheckFeature,
                  );
                },));
              }else
                if(imagePath == null){
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No image selected.'),
                ));
              }
              else{
                setState(() {
                  AutovalidateMode.always;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please fill all the fields.'),
                ));
              }
            }),
          ],),
        ),
      ),
    );
  }
}

class CustomPickerImage  extends StatefulWidget{
  const CustomPickerImage({super.key, this.pickerImage,});
  final Function(File?)? pickerImage;
  @override
  State<CustomPickerImage> createState() => _CustomPickerImageState();
}

class _CustomPickerImageState extends State<CustomPickerImage> {
  bool isLoading = false;
  File? imagePath;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Skeletonizer(
            enabled: isLoading,
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  isLoading = true;
                });
                final ImagePicker picker = ImagePicker();
                final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  imagePath = File(image.path);
                  widget.pickerImage!(imagePath!);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('No image selected.'),
                      ));
                }
                setState(() {
                  isLoading = false;
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child:imagePath == null ?
                Container(
                  width: 200,
                  height: 200,
                  decoration: const ShapeDecoration(
                    color: Colors.black12,
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 1,
                        color: Color(0xFFF1F1F5),
                      ),
                    ),
                  ),
                  child: const ClipOval(child: Icon(Icons.image_outlined,size: 150,)),
                ) :
                ClipOval(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: const ShapeDecoration(
                      color: Colors.black12,
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 1,
                          color: Color(0xFFF1F1F5),
                        ),
                      ),
                    ),
                    child: Image.file(
                      File(imagePath!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: imagePath != null,
            child: Positioned(
              left: 8,
              top: 8,
              child: GestureDetector(
                onTap: () {
                  imagePath = null;
                  setState(() {});
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(
                      side: BorderSide(
                        width: 1,
                        color: Color(0xFFF1F1F5),
                      ),
                    ),
                  ),
                  child: const Center(child: Icon(
                    Icons.auto_delete, color: Colors.red,
                  ),
                  ),
                ),
              ),
            ),
          ),
        ]
    );
  }
}


