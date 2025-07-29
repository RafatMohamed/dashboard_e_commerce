import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNotificationW extends StatelessWidget {
  const CustomNotificationW({
    super.key,required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: onTap,
     child: Container(
        width: 44,
        height: 44,
        decoration: const ShapeDecoration(
          color: Color(0xFFEEF8ED),
          shape: OvalBorder(
            side: BorderSide(
              width: 1,
              color: Color(0xFFF1F1F5),
            ),
          ),
        ),
       child: const Icon(Icons.notifications_none_outlined),
      ),
   );
  }
}
