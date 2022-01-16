//import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:project/models/summary_models.dart';
import '../loading/loading.dart';

import 'package:project/services/requests.dart';

class CameraScreen extends StatefulWidget {
  static const routeName = "/camera";

  final camera;

  CameraScreen(this.camera);

  _CameraScreenState createState() => _CameraScreenState(camera);
}

class _CameraScreenState extends State<CameraScreen> {
  final camera;
  bool _flashState = false;

  RequestsService rs = RequestsService();

  _CameraScreenState(this.camera);

  //CameraController _controller;
  Future<void> _initializeControllerFuture;

  // Kad rodytu loading ekrana, kai paspaudi fotkint
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    //_controller = CameraController(camera, ResolutionPreset.high);
    //_initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    //_controller.dispose();
    super.dispose();
  }

  _toggleFlashState() {
    _flashState = _flashState ? false : true;
    //_controller.setFlashMode(_flashState ? FlashMode.off : FlashMode.torch);
  }

  _toggleGridlines() {}

  _takePicture() async {
    ByteData bd = await rootBundle.load("assets/camera/example.jpg");

    // print( rs.postImage( bd ));
    rs.postImage(bd).then((value) => {
          Navigator.pushNamed(context, "/new_summary_data",
              arguments: SummaryData(
                  title: "Enter title",
                  author: "Enter author",
                  date: "Random date",
                  content: value)),
        });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) return Loading();
    return (Scaffold(
      body: Stack(
        children: [
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.

                return Transform.scale(
                  //scale: 1 / (_controller.value.aspectRatio * MediaQuery.of(context).size.aspectRatio),
                  alignment: Alignment.topCenter,
                  //child: CameraPreview(_controller),
                );
              } else {
                // Otherwise, display a loading indicator.
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            heightFactor: 8.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Image.asset("assets/camera/flash.png"),
                  onTap: _toggleFlashState,
                ),
                GestureDetector(
                  child: Image.asset("assets/camera/camera.png"),
                  onTap: () {
                    setState(() {
                      _loading = true;
                    });
                    _takePicture();
                  },
                ),
                GestureDetector(
                  child: Image.asset("assets/camera/grid.png"),
                  onTap: _toggleGridlines,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
