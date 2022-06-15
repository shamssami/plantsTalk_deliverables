import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tflite/tflite.dart';

class Classifier {
  late File imageFile;
  late List outputs;

  @override
  void initState() {
    loadModel();
  }

  Future<List?> getDiseaseByCamera(ImageSource imageSource) async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    imageFile = File(image!.path);
    await loadModel();
    var result = await classifyImage(imageFile);
    Tflite.close();

    return result;
  }

  Future<List?> getDisease(ImageSource imageSource) async {
    var image = await ImagePicker().pickImage(source: imageSource);
    imageFile = File(image!.path);
    await loadModel();
    var result = await classifyImage(imageFile);
    Tflite.close();

    return result;
  }

  Future loadModel() async {
    print("DEBUG: Inside Load Model Function");
    Tflite.close();
    try {
      String? res;
      res = await Tflite.loadModel(
        model: "assets/model/plant_disease_model_plantsTalk.tflite",
        labels: "assets/model/labels.txt",
      );
      print(res);
    } on PlatformException {
      print('Failed to load model.');
    }
  }

  Future<List?> classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    return output;
  }

  void dispose() {
    dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  ///////////////////////////////////////////////////////////////////////////////////
  void showErrorProcessing(BuildContext context) {
    AlertDialog dialogWithImage = AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(height: 120, color: Colors.blueGrey),
                Column(
                  children: [
                    Icon(Icons.warning, color: Colors.white, size: 32),
                    Text('OOPs...',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                )
              ],
            ),
            30.height,
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                  "We encountered a issue while processing!\nTip: Please make sure you take the image up close and with proper lighting.",
                  style: secondaryTextStyle()),
            ),
            16.height,
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 153, 140),
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text("Try again",
                    style: TextStyle(color: white, fontSize: 16)),
              ),
            ),
            16.height,
          ],
        ),
      ),
      contentPadding: EdgeInsets.all(0),
    );
    showDialog(
        context: context, builder: (BuildContext context) => dialogWithImage);
  }
}
