import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:eventer/blocs/form_item/form_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DateForm extends StatelessWidget {
  const DateForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DateTimeField(
        format: DateFormat("yyyy-MM-dd    HH:mm"),
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2022),
          );
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            BlocProvider.of<FormItemBloc>(context).add(
              FormItemUpdateDateEvent(
                DateTimeField.combine(date, time),
              ),
            );
            return DateTimeField.combine(date, time);
          } else {
            BlocProvider.of<FormItemBloc>(context).add(
              FormItemUpdateDateEvent(currentValue),
            );
            return currentValue;
          }
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Tap to pick date',
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
