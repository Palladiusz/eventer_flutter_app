import 'package:flutter/material.dart';

class EditDesc extends StatelessWidget {
  const EditDesc({
    Key key,
    this.myController,
  }) : super(key: key);
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        maxLines: null,
        expands: true,
        maxLength: 256,
        controller: myController,
        decoration: InputDecoration(
          counterStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          hintText: 'Tap to add description',
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
        onChanged: null,
      ),
    );
  }
}
