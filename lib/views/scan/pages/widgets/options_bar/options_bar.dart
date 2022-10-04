import 'package:flutter/material.dart';
import 'package:project_scanit/models/scan/image_processing_model.dart';
import 'package:project_scanit/views/scan/pages/widgets/options_bar/widgets/option_tile.dart';
import 'package:provider/provider.dart';

class OptionsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageProcessingModelProvider =
        Provider.of<ImageProcessingModel>(context);
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      color: Colors.white,
      elevation: 8.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OptionTile(
              icon: Icons.add_circle_rounded,
              text: 'Add Page',
              onTap: () {},
            ),
            OptionTile(
              icon: Icons.crop_rounded,
              text: 'Crop',
              onTap: () {},
            ),
            OptionTile(
              icon: Icons.rotate_right_rounded,
              text: 'Rotate',
              onTap: () => imageProcessingModelProvider.rotate(),
            ),
            OptionTile(
              icon: Icons.filter_rounded,
              text: 'Filter',
              onTap: () {},
            ),
            OptionTile(
              icon: Icons.view_array_rounded,
              text: 'Rearrange',
              onTap: () {},
            ),
            OptionTile(
              icon: Icons.remove_circle_rounded,
              text: 'Remove',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
