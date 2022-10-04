import 'package:flutter/material.dart';
import 'package:project_scanit/injection.dart';
import 'package:project_scanit/models/scan/capture_model.dart';
import 'package:project_scanit/models/scan/image_processing_model.dart';
import 'package:project_scanit/views/scan/widgets/bottom_bar/widgets/capture_button.dart';
import 'package:project_scanit/views/scan/pages/pages.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  final imageProcessingModel = getIt<ImageProcessingModel>();
  @override
  Widget build(BuildContext context) {
    final captureModelProvider = Provider.of<CaptureModel>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChangeNotifierProvider<ImageProcessingModel>(
            create: (context) => imageProcessingModel,
            builder: (context, _) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.photo_library_rounded,
                  color: Colors.white30,
                ),
                CaptureButton(),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ChangeNotifierProvider<ImageProcessingModel>.value(
                        value: imageProcessingModel,
                        child: Pages(),
                      ),
                    ),
                  ),
                  child: Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => captureModelProvider.toggleFlash(),
                child: Icon(
                  Icons.flash_on_rounded,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () => captureModelProvider.toggleCamera(),
                child: Icon(
                  Icons.camera_rear_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
