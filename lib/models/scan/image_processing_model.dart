import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:project_scanit/models/scan/captured_image.dart';
import 'package:project_scanit/models/scan/image_filter.dart';

class ImageProcessingModel extends ChangeNotifier {
  // TODO: write all images processing functions here :)
  // See capture button onTap to get Uint8List image :)
  List<CapturedImage> images = [];

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

  applyFilter() {}

  reorder() {}

  saveAsPdf() {}
}
