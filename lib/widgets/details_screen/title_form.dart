import 'package:flutter/material.dart';

class TitleForm extends StatelessWidget {
  const TitleForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Tap to add tittle',
          hintStyle: TextStyle(
            fontSize: 28,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
