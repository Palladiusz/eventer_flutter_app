import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    return NeumorphicAppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
