import 'package:flutter/material.dart';
import 'package:learning_flutter_app/screens/details_screen.dart';
import 'package:learning_flutter_app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routes = <String, Widget Function(BuildContext)>{
    "/details": (context) => const DetailsScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      home: HomeScreen(),
    );
  }
}
