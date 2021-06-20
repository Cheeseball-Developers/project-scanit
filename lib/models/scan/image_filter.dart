import 'dart:typed_data';

import 'package:project_scanit/models/scan/captured_image.dart';

class ImageFilter {
  Future<CapturedImage> auto(Uint8List image) async {
    return CapturedImage(
      image: image,
      filterType: ImageFilterType.auto,
      isProcessing: false,
    );
  }
}

enum ImageFilterType {
  none,
  auto,
  bnw,
  hc,
}