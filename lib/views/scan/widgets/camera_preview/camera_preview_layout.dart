import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:project_scanit/models/scan/capture_model.dart';
import 'package:provider/provider.dart';

class CameraPreviewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final captureModelProvider = Provider.of<CaptureModel>(context);
    final size = MediaQuery.of(context).size;
    return captureModelProvider.controllerOption.fold(
          () => Material(color: Colors.red, child: Center(child: Text('Loading'))),
          (controller) => ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            child: Container(
              width: size.width,
              height: size.height*0.75,
              child: Stack(
                children: <Widget>[
                  CameraPreview(controller),
                ],
              ),
            ),
          ),
    );
  }
}
