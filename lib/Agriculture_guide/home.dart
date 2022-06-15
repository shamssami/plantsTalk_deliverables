import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class camera extends StatefulWidget {
  camera({
    Key? key,
    required this.camera2,
  }) : super(key: key);
  final CameraDescription camera2;

  @override
  _HomeState createState() => _HomeState();
}

late final List output1;

class _HomeState extends State<camera> {
  //////////////////////////////////////////////////////////////
  bool _loading = true;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  final picker = ImagePicker();

  late File _image;
  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera2,
      // Define the resolution to use.
      ResolutionPreset.high,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();

    loadModel().then((value) {
      setState(() {});
    });
  }

  detectImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      threshold: 0.6,
      numResults: 2,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      output1 = output!;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }
    setState(() {
      _image = File(image.path);
    });
    detectImage(_image);
  }

  pickGallaryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    setState(() {
      _image = File(image.path);
    });
    detectImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 221, 214),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(252, 111, 128, 117),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            alignment: Alignment.centerRight,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu),
            alignment: Alignment.centerLeft,
            onPressed: () {},
          )
        ],
      ),

      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return RotationTransition(
                turns: AlwaysStoppedAnimation(270 / 360),
                child: CameraPreview(_controller));
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Wrap(
        children: <Widget>[
          Container(
            child: FloatingActionButton(
              onPressed: () async {
                // Take the Picture in a try / catch block. If anything goes wrong,
                // catch the error.
                try {
                  // Ensure that the camera is initialized.
                  await _initializeControllerFuture;

                  // Attempt to take a picture and get the file `image`
                  // where it was saved.
                  final image = await _controller.takePicture();
                  if (image == null) {
                    return null;
                  }
                  setState(() {
                    _image = File(image.path);
                  });
                  detectImage(_image);

                  // If the picture was taken, display it on a new screen.
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DisplayPictureScreen(
                        // Pass the automatically generated path to
                        // the DisplayPictureScreen widget.
                        imagePath: image.path,
                        // output: output1,
                      ),
                    ),
                  );
                } catch (e) {
                  // If an error occurs, log the error to the console.
                  print(e);
                }
              },
              child: const Icon(Icons.camera_alt_rounded),
            ),
          ),
          Container(
            child: FloatingActionButton(
              onPressed: () {
                pickGallaryImage();
              },
              child: const Icon(Icons.image),
            ),
          )
        ],

        // Provide an onPressed callback.
      ),

      // body: Container(
      //     padding: EdgeInsets.symmetric(horizontal: 24),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         SizedBox(height: 50),
      //         Text(
      //           'Plants-Talk App',
      //           style: TextStyle(color: Colors.white, fontSize: 19),
      //         ),
      //         SizedBox(height: 5),
      //         Text(
      //           'Plant Disease Detection',
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 29,
      //             fontWeight: FontWeight.w500,
      //           ),
      //         ),
      //         SizedBox(height: 50),
      //         Center(
      //             child: _loading
      //                 ? Container(
      //                     width: 400,
      //                     child: Column(
      //                       children: <Widget>[
      //                         Image.asset('assets/PlantsTalk_Logo.png'),
      //                         SizedBox(height: 50),
      //                       ],
      //                     ))
      //                 : Container(
      //                     // child: Column(
      //                     //   children: <Widget>[
      //                     //     Container(
      //                     //       height: 250,
      //                     //       child: Image.file(_image),
      //                     //     ),
      //                     //     SizedBox(
      //                     //       height: 20,
      //                     //     ),
      //                     //     _output != null
      //                     //         ? Text(
      //                     //             '${_output[0]['label']}',
      //                     //             style: TextStyle(
      //                     //                 color: Colors.white, fontSize: 15),
      //                     //           )
      //                     //         : Container(),
      //                     //     SizedBox(height: 10),
      //                     //   ],
      //                     // )
      //                     )),
      //         Container(
      //             width: MediaQuery.of(context).size.width,
      //             child: Column(
      //               children: <Widget>[
      //                 GestureDetector(
      //                   onTap: () {
      //                     //  pickImage();
      //                   },
      //                   child: Container(
      //                     width: MediaQuery.of(context).size.width - 250,
      //                     alignment: Alignment.center,
      //                     padding: EdgeInsets.symmetric(
      //                         horizontal: 25, vertical: 18),
      //                     decoration: BoxDecoration(
      //                       color: Colors.redAccent,
      //                       borderRadius: BorderRadius.circular(6),
      //                     ),
      //                     child: Text(
      //                       'Capture a photo',
      //                       style: TextStyle(color: Colors.white),
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(height: 15),
      //                 GestureDetector(
      //                   onTap: () {
      //                     //      pickGallaryImage();
      //                   },
      //                   child: Container(
      //                       height: 30.0,
      //                       padding: EdgeInsets.all(10.0),
      //                       child: TextFormField(
      //                         decoration: new InputDecoration(
      //                             hintText: "username",
      //                             icon: new Icon(Icons.person_pin)),
      //                       )

      //                       /////////////
      //                       ),
      //                 ),
      //               ],
      //             )),
      //       ],
      //     ))

      //     ,
      /////////////////////////////////////////////////////////////////////////////////////////////
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Color.fromRGBO(103, 122, 109, 9),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism),
              label: 'Agricultural Guide',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              label: 'Camera',
              backgroundColor: Colors.black),
              
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Community',
              backgroundColor: Colors.black)
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  // final List output;
  // ignore: use_key_in_widget_constructors
  const DisplayPictureScreen({required this.imagePath
      //  required this.output
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Plant Disease Detection')),
        // The image is stored as a file on the device. Use the `Image.file`
        // constructor with the given path to display the image.
        body: SizedBox(
          width: 700,
          child: Card(
              child: Column(
            children: <Widget>[
              Image.file(
                File(imagePath),
                height: 500,
                width: 600,
              ),
              Text('This is the disease name',
                  style: TextStyle(
                    height: 4,
                    color: Colors.black,
                    fontSize: 20,
                    backgroundColor: Color.fromARGB(247, 202, 231, 211),
                  ),
                  maxLines: 3,
                  textWidthBasis: TextWidthBasis.longestLine),
              // ignore: unnecessary_null_comparison
              // output != null
              //     ? Text(
              //         'The Result: ${output[0]['label']}',
              //         style: TextStyle(color: Colors.black, fontSize: 15),
              //       )
              //     : Container(
              //         child: Text('Result is not known'),
              //       ),
              SizedBox(height: 10)
            ],
          )),
        ));
  }
}