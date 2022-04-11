import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:icon_creator/screens/home_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (context) => const HomePage(),
};
