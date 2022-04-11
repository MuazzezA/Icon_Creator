import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:icon_creator/screens/edit_screen.dart';
import 'package:icon_creator/screens/home_screen.dart';
import 'package:icon_creator/screens/save_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (context) => const HomePage(),
  EditIconPage.route: (context) => EditIconPage(
      ModalRoute.of(context)!.settings.arguments == null
          ? null as File
          : ModalRoute.of(context)?.settings.arguments as File),
  SavePage.route: (context) =>
      SavePage(ModalRoute.of(context)?.settings.arguments as File),
};
