import 'package:eventer/blocs/form_item/form_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescForm extends StatelessWidget {
  const DescForm({
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
        controller: myController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Tap to add description',
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
        onChanged: (value) => BlocProvider.of<FormItemBloc>(context)
            .add(FormItemUpdateDescEvent(myController.text)),
      ),
    );
  }
}
