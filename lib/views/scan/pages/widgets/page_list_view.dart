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
    return Column(
      children: [
        Expanded(
          child: Swiper(
            scrollDirection: Axis.horizontal,
            itemCount: imageProcessingModelProvider.images.length,
            loop: false,
            scale: 0.9,
            viewportFraction: 0.8,
            onIndexChanged: (index) =>
                imageProcessingModelProvider.setIndex(index),
            itemBuilder: (context, index) {
              return Center(
                child: Material(
                  color: Colors.transparent,
                  elevation: 8.0,
                  child: Image.memory(
                      imageProcessingModelProvider.images[index].image),
                ),
              );
            },
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(512.0),
          color: Colors.white,
          elevation: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Page ${imageProcessingModelProvider.index+1}',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        ),
      ],
    );
  }
}
