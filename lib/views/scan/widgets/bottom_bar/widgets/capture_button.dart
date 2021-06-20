import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:project_scanit/models/scan/capture_model.dart';
import 'package:project_scanit/models/scan/image_processing_model.dart';
import 'package:provider/provider.dart';

class CaptureButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final captureModelProvider = Provider.of<CaptureModel>(context);
    final imageProcessingModelProvider =
        Provider.of<ImageProcessingModel>(context);
    final size = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        if (captureModelProvider.captureButtonAnimation != 'Capture') {
          captureModelProvider
              .capture()
              .then((image) => imageProcessingModelProvider.getRawImage(image));
        }
      },
      onHorizontalDragUpdate: (startDetails) {
        if (startDetails.globalPosition.dx >
            3 * MediaQuery.of(context).size.width / 5) {
          print(startDetails.globalPosition.dx);
          captureModelProvider.startZooming(ZoomType.zoomIn);
        } else if (startDetails.globalPosition.dx <
            2 * MediaQuery.of(context).size.width / 5) {
          captureModelProvider.startZooming(ZoomType.zoomOut);
        }
      },
      onHorizontalDragEnd: (endDetails) {
        captureModelProvider.stopZooming(ZoomType.zoomIn);
      },
      child: SizedBox(
        width: size / 2,
        height: size / 6,
        child: FlareActor(
          'assets/flares/capture_button.flr',
          animation: captureModelProvider.captureButtonAnimation,
          antialias: true,
        ),
      ),
    );
  }
}
