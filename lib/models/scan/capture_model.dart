import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class CaptureModel extends ChangeNotifier {
  String captureButtonAnimation = '';
  Option<CameraController> controllerOption = none();
  Option<List<CameraDescription>> camerasOption = none();

  int cameraIndex = 0;
  FlashMode flashMode = FlashMode.auto;

  Option<ZoomType> _zoomTypeOption = none();
  double _zoomLevel = 1.0;

  CaptureModel() {
    availableCameras().then((cams) {
      final List<CameraDescription> cameras = [];
      for (final cam in cams) {
        if (cam.lensDirection == CameraLensDirection.back ||
            cam.lensDirection == CameraLensDirection.external) {
          cameras.add(cam);
        }
      }
      camerasOption = some(cameras);
      final controller =
          CameraController(cams[cameraIndex], ResolutionPreset.max);
      controller.initialize().then((value) => notifyListeners());
      controllerOption = some(controller);
      notifyListeners();
    });
  }

  void toggleFlash() {
    controllerOption.fold(
      () {},
      (controller) {
        switch (flashMode) {
          case FlashMode.auto:
            flashMode = FlashMode.off;
            break;
          case FlashMode.off:
            flashMode = FlashMode.always;
            break;
          case FlashMode.always:
            flashMode = FlashMode.torch;
            break;
          case FlashMode.torch:
            flashMode = FlashMode.auto;
            break;
        }
        controller.setFlashMode(flashMode);
        notifyListeners();
      },
    );
  }

  void toggleCamera() {
    cameraIndex += 1;
    _zoomLevel = 1.0;
    camerasOption.fold(
      () {},
      (cams) {
        if (cameraIndex >= cams.length) {
          cameraIndex = 0;
        }
        final controller =
            CameraController(cams[cameraIndex], ResolutionPreset.max);
        controller.initialize().then((value) => notifyListeners());
        controllerOption = some(controller);
        notifyListeners();
      },
    );
  }

  void zoom() async {
    controllerOption.fold(() => null, (controller) {
      _zoomTypeOption.fold(() => null, (zoomType) async {
        if (zoomType == ZoomType.zoomIn) {
          if (_zoomLevel < 8.0) {
            _zoomLevel += 0.05;
          }
        } else {
          if (_zoomLevel > 1.0) {
            _zoomLevel -= 0.05;
          }
        }
        controller.setZoomLevel(_zoomLevel);
        Vibration.vibrate(duration: 5, amplitude: 16);
        notifyListeners();
        await Future.delayed(Duration(milliseconds: 40));
        zoom();
      });
    });
  }

  void startZooming(ZoomType zoomType) {
    _zoomTypeOption.fold(() {
      if (zoomType == ZoomType.zoomIn) {
        captureButtonAnimation = 'Zoom In In';
        notifyListeners();
      } else {
        captureButtonAnimation = 'Zoom Out In';
        notifyListeners();
      }
      _zoomTypeOption = some(zoomType);
      zoom();
    }, (modelZoomType) {
      if (modelZoomType != zoomType) {
        if (zoomType == ZoomType.zoomIn) {
          captureButtonAnimation = 'Zoom In In';
          notifyListeners();
        } else {
          captureButtonAnimation = 'Zoom Out In';
          notifyListeners();
        }
        _zoomTypeOption = some(zoomType);
        zoom();
      }
    });
  }

  void stopZooming(ZoomType zoomType) {
    if (zoomType == ZoomType.zoomIn) {
      captureButtonAnimation = 'Zoom In Out';
      notifyListeners();
    } else {
      captureButtonAnimation = 'Zoom Out Out';
      notifyListeners();
    }
    _zoomTypeOption = none();
    notifyListeners();
  }

  Future<Uint8List> capture() {
    captureButtonAnimation = 'Click';
    Vibration.vibrate(duration: 100, amplitude: 8).whenComplete(() =>
        Future.delayed(Duration(milliseconds: 100),
            () => Vibration.vibrate(duration: 15, amplitude: 128)));
    notifyListeners();
    return controllerOption.fold(
      () => null,
      (controller) => controller.takePicture().then((xFile) {
        print('yep');
        captureButtonAnimation = '';
        notifyListeners();
        return xFile.readAsBytes();
      }),
    );
  }
}

enum ZoomType { zoomIn, zoomOut }
