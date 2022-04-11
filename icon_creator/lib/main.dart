import 'package:flutter/material.dart';
import 'package:icon_creator/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Icon Creator",
      initialRoute: "/",
      routes: routes,
    );
  }
}
