import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditDate extends StatelessWidget {
  const EditDate({
    Key key,
    this.myController,
  }) : super(key: key);

  final DateTime myController;

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
        autovalidate: true,
        validator: (date) {
          if (date == null) {}
          return;
        },
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

            return DateTimeField.combine(date, time);
          } else {
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
