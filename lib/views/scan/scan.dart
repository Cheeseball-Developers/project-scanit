import 'package:flutter/material.dart';
import 'package:project_scanit/models/scan/capture_model.dart';
import 'package:project_scanit/views/scan/widgets/bottom_bar/bottom_bar.dart';
import 'package:project_scanit/views/scan/widgets/camera_preview/camera_preview_layout.dart';
import 'package:provider/provider.dart';

class Scan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ChangeNotifierProvider(
        create: (BuildContext context) => CaptureModel(),
        builder: (context, _) => Container(
          color: Color(0xff223d41),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Hero(
                  tag: 'introToCam',
                  child: Material(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                    elevation: 8.0,
                    child: CameraPreviewLayout(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: BottomBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
