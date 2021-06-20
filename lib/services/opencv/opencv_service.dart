import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:opencv/opencv.dart';

@LazySingleton()
class OpenCVService {
  OpenCV openCV = OpenCV();

  Future<Uint8List> rotate(double degree) async {
    // TODO: add rotation function
    return Uint8List(0);
  }
}