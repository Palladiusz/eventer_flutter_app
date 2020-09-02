import 'package:flutter/material.dart';

class EditTitle extends StatelessWidget {
  final TextEditingController myController;

  const EditTitle({Key key, this.myController}) : super(key: key);
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
        controller: myController,
        maxLength: 32,
        maxLines: null,
        decoration: InputDecoration(
          counterStyle: TextStyle(color: Colors.white),
          hintText: 'Tap to add tittle',
          hintStyle: TextStyle(
            fontSize: 28,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 28),
        onChanged: null,
      ),
    );
  }
}
