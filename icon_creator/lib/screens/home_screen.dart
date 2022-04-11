import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imgFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Where ?",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 75,
              ),
              TextButton.icon(
                onPressed: () {
                  sourceForImage(context, 0);
                },
                icon: const Icon(Icons.image),
                label: const Text("Gallery"),
              ),
              TextButton.icon(
                onPressed: () {
                  sourceForImage(context, 1);
                },
                icon: const Icon(Icons.camera),
                label: const Text("Camera"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sourceForImage(BuildContext context, int id) async {
    dynamic image;

    switch (id) {
      case 0: // gallery
        image = await ImagePicker().pickImage(source: ImageSource.gallery);
        break;
      case 1: // camera
        image = await ImagePicker().pickImage(source: ImageSource.camera);
        break;
      default:
        image = null;
        break;
    }

    if (image != null) {
      imgFile = File(image.path);
      if (imgFile != null) {
        Navigator.pushNamed(context, '/editScreen', arguments: imgFile)
            .then((value) {
          Navigator.maybePop(context);
        });
      }
    } else {
      Navigator.pop(context, "/");
    }
  }
}
