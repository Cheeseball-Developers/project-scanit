import 'dart:typed_data';

import 'package:project_scanit/models/scan/image_filter.dart';

class CapturedImage {
  final Uint8List image;
  final ImageFilterType filterType;
  final bool isProcessing;

  CapturedImage({
    required this.image,
    required this.filterType,
    required this.isProcessing,
  });
}
