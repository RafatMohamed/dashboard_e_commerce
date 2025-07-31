import 'package:dashboard_e_commerce_food/core/helper/custom_bloc_observe.dart';
import 'package:dashboard_e_commerce_food/features/Home/View/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/helper/on_generate_routes.dart';
import 'core/service/get_it.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = CustomBlocObserver();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute:onGenerateRoute ,
      initialRoute: HomeView.routeName,
    );
  }
}
