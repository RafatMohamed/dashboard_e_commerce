import 'package:flutter/material.dart';
import '../../features/Add_product/View/add_product_view.dart';
import '../../features/Home/View/home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting){
  switch(setting.name){
     case HomeView.routeName:
     return MaterialPageRoute(builder: (context) {
        return const HomeView();
      },);
     case AddProductView.routeName:
     return MaterialPageRoute(builder: (context) {
        return const AddProductView();
      },);
    default:
      return MaterialPageRoute(builder: (context) {
        return const Scaffold();
      },);
}
}