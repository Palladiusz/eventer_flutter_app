import 'package:eventer/constants.dart';
import 'package:eventer/widgets/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class DetailsScreen extends StatelessWidget {
  static const String id = '/details_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: 'Create New Event',
        ),
        backgroundColor: kMinorBrownColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
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
                      hintStyle: TextStyle(fontSize: 28),
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Tap to add description',
                      hintStyle: TextStyle(fontSize: 18),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
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
                          initialTime: TimeOfDay.fromDateTime(
                              currentValue ?? DateTime.now()),
                        );
                        return DateTimeField.combine(date, time);
                      } else {
                        return currentValue;
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Tap to pick date',
                      hintStyle: TextStyle(fontSize: 18),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                RaisedButton(
                  child: Text(
                    'Submit event',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: kRedColor,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
