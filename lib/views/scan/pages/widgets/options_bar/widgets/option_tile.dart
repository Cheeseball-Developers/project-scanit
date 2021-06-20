import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const OptionTile({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: (MediaQuery.of(context).size.width/9)-16.0),
          Padding(padding: const EdgeInsets.only(bottom: 4.0),),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 10.0
            ),
          )
        ],
      ),
    );
  }
}
