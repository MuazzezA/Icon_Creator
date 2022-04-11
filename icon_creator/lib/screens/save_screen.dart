import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class SavePage extends StatefulWidget {
  static var route = '/saveScreen';
  File croppedFile;

  SavePage(this.croppedFile, {Key? key}) : super(key: key);

  @override
  State<SavePage> createState() => _SavePageState(croppedFile);
}

class _SavePageState extends State<SavePage> {
  @override
  void initState() {
    super.initState();
  }

  File croppedFile;

  _SavePageState(this.croppedFile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.file(
            croppedFile,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: () async {
              await saveImage(croppedFile);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Image Saved"),
                duration: Duration(seconds: 1),
              ));
              await Future.delayed(const Duration(seconds: 1));
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            },
            icon: const Icon(Icons.save),
            label: const Text("Save"),
          ),
        ],
      ),
    );
  }

  saveImage(File image) async {
    await ImageGallerySaver.saveImage(image.readAsBytesSync());
  }
}
