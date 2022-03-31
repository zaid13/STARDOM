import 'package:camera/camera.dart';
import "package:flutter/material.dart";
import 'package:stardom/util/colorScheme.dart';

late CameraController controller;
List<CameraDescription> cameras = [];


var initialized=false;

class cameraScreen extends StatefulWidget {
  const cameraScreen({Key? key}) : super(key: key);

  @override
  _cameraScreenState createState() => _cameraScreenState();
}

class _cameraScreenState extends State<cameraScreen> {

  oneTime() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    await controller.initialize().then((value) {
      setState(() {
        initialized=true;
      });
    });

    return 0;
  }

  @override
  void initState() {
    super.initState();
    oneTime();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;


    if (initialized==false) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: backBlack,
        body:Stack(
            children: [
              Container(
                width: width,
                height: height,
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: Container(
                      child: Center(
                          child: CameraPreview(
                            controller,
                          )
                      )
                  ),
                ),
              ),
              Container(
                width: width,
                height: height,
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: width,
                    color: Colors.black,
                    padding: EdgeInsets.all(30),
                    child: Icon(Icons.circle,color:  Colors.white,size: 80,)
                ),
              )
            ],
          ),

      );
    }
  }
}
