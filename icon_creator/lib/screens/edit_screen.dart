import 'dart:io';

import 'package:flutter/material.dart';
import 'package:icon_creator/screens/home_screen.dart';
import 'package:image_cropper/image_cropper.dart';

class EditIconPage extends StatefulWidget {
  static var route = '/editScreen';
  File imageFile;
  EditIconPage(this.imageFile, {Key? key}) : super(key: key);

  @override
  _EditIconPageState createState() => _EditIconPageState(imageFile);
}

enum AppState {
  picked,
  cropped,
}

class _EditIconPageState extends State<EditIconPage> {
  File imageFile;
  _EditIconPageState(this.imageFile);

  late AppState state;

  @override
  void initState() {
    super.initState();
    state = AppState.picked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editor"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          if (imageFile != null)
            GestureDetector(
              onTap: () {},
              child: Image.file(imageFile),
            )
          else
            showAlertDialog(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[400],
        onPressed: () {
          if (state == AppState.picked) {
            cropImage(imageFile.path);
          }
        },
        child: _buildButtonIcon(),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("Okey"),
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Don't' Found"),
      content: const Text("Go To Home Screen"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _buildButtonIcon() {
    if (state == AppState.picked) {
      return const Icon(Icons.crop);
    } else if (state == AppState.cropped) {
      return const Icon(Icons.done);
    } else {
      return Container();
    }
  }

  Future<void> cropImage(filePath) async {
    File? croppedFile = await ImageCropper().cropImage(
      sourcePath: filePath,
      compressQuality: 50,
      maxHeight: 500,
      maxWidth: 500,
      compressFormat: ImageCompressFormat.png,
    );
    if (croppedFile != null) {
      setState(() {
        imageFile = croppedFile;
        state = AppState.cropped;
        saveImage(context, croppedFile);
      });
    }
  }

  void saveImage(BuildContext context, File file) {
    Navigator.pushNamed(context, '/saveScreen', arguments: file);
  }
}
