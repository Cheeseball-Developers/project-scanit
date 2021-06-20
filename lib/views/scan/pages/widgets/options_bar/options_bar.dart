import 'package:flutter/material.dart';
import 'package:project_scanit/views/scan/pages/widgets/options_bar/widgets/option_tile.dart';

class OptionsBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OptionTile(icon: Icons.add_circle_rounded, text: 'Add Page', onTap: () {}),
          OptionTile(icon: Icons.crop_rounded, text: 'Crop', onTap: () {}),
          OptionTile(icon: Icons.rotate_right_rounded, text: 'Rotate', onTap: () {}),
          OptionTile(icon: Icons.filter_rounded, text: 'Filter', onTap: () {}),
          OptionTile(icon: Icons.view_array_rounded, text: 'Rearrange', onTap: () {}),
          OptionTile(icon: Icons.remove_circle_rounded, text: 'Remove', onTap: () {}),
        ],
      ),
    );
  }
}
