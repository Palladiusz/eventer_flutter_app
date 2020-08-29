import 'package:flutter/material.dart';

class DescEvent extends StatelessWidget {
  final String desc;
  const DescEvent({
    Key key,
    this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }
}
