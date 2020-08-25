import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String desc;
  final DateTime date;
  final bool checkedOut;

  const EventCard({Key key, this.title, this.desc, this.date, this.checkedOut})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text('${date.hour.toString()}'),
        Text(desc),
        Checkbox(
          value: false,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
