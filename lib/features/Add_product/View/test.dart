import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestAddProductView extends StatelessWidget {
  const TestAddProductView({Key? key, required this.name, required this.price, required this.quantity, required this.description, required this.category, required this.image, required this.code,required this.isFeatured}) : super(key: key);
  final String name ;
  final String price ;
  final String quantity ;
  final String code ;
  final String description ;
  final String category ;
  final File image ;
  final bool isFeatured ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              spacing: 24,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(name),
                 Text(price),
                 Text(quantity),
                 Text(description),
                 Text(code),
                 Text(category),
                 Text(isFeatured.toString()),
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
                      File(image.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}