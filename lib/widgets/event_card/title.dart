import 'package:flutter/material.dart';

class TitleEvent extends StatelessWidget {
  final String title;
  final bool isExpanded;
  const TitleEvent({this.title, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    if (isExpanded == false) {
      return Text(
        title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      );
    } else {
      return Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      );
    }
  }
}
