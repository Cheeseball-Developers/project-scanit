import 'package:flutter/material.dart';
import 'package:project_scanit/models/scan/image_processing_model.dart';
import 'package:project_scanit/views/scan/pages/widgets/options_bar/options_bar.dart';
import 'package:project_scanit/views/scan/pages/widgets/page_list_view.dart';
import 'package:provider/provider.dart';

class Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff262626),
      child: Column(
        children: [
          Expanded(child: PageListView()),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            color: Colors.white,
            elevation: 8.0,
            child: OptionsBar(),
          ),
        ],
      ),
    );
  }
}
