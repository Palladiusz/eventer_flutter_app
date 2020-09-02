import 'package:eventer/blocs/form_item/form_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleForm extends StatelessWidget {
  final String initialValue;
  final myController = TextEditingController();

  TitleForm({Key key, this.initialValue}) : super(key: key) {
    myController.text = initialValue;
  }

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
        onChanged: BlocProvider.of<FormItemBloc>(context).titleField.onChanged,
      ),
    );
  }
}
