import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:project_scanit/models/scan/captured_image.dart';
import 'package:project_scanit/models/scan/image_filter.dart';
import 'package:project_scanit/services/opencv/opencv_service.dart';

@LazySingleton()
class ImageProcessingModel extends ChangeNotifier {
  // TODO: write all images processing functions here :)
  // See capture button onTap to get Uint8List image :)
  final OpenCVService _openCVService;
  List<CapturedImage> images = [];
  int index = 0;

  ImageProcessingModel(this._openCVService);

  void setIndex(int newIndex) {
    index = newIndex;
    notifyListeners();
  }

  void getRawImage(Uint8List image) async {
    images.add(CapturedImage(
      image: image,
      filterType: ImageFilterType.none,
      isProcessing: false,
    ));
    print(images);
    notifyListeners();
  }

  detectEdges() {}

  cropToEdges() {}

  rotate() {
    // TODO: rotate image 90 deg clockwise from list at `index`
    notifyListeners();
  }

  applyFilter() {}

  reorder() {}

  saveAsPdf() {}
}
