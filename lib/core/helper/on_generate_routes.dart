import 'package:flutter/material.dart';
import '../../features/Home/View/home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting){
  switch(setting.name){
     case HomeView.routeName:
     return MaterialPageRoute(builder: (context) {
        return const HomeView();
      },);
    default:
      return MaterialPageRoute(builder: (context) {
        return const Scaffold();
      },);
}
}