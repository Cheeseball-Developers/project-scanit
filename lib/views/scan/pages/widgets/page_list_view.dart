import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:project_scanit/models/scan/image_processing_model.dart';
import 'package:provider/provider.dart';

class PageListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageProcessingModelProvider =
        Provider.of<ImageProcessingModel>(context);

    print(imageProcessingModelProvider.images.length);
    return Swiper(
      scrollDirection: Axis.horizontal,
      itemCount: imageProcessingModelProvider.images.length,
      loop: false,
      scale: 0.9,
      viewportFraction: 0.8,
      itemBuilder: (context, index) {
        return Center(
          child: Material(
            color: Colors.transparent,
            elevation: 8.0,
            child:
                Image.memory(imageProcessingModelProvider.images[index].image),
          ),
        );
      },
    );
  }
}
