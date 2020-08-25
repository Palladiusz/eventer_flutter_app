import 'package:eventer/constants.dart';
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
    return Container(
      decoration: BoxDecoration(
          color: kMinorBrownColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black, width: 3)),
      margin: EdgeInsets.only(top: 15, bottom: 15, left: 0, right: 20),
      width: 350,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            desc,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            height: 70,
          ),
          Text(
            'Time to start event:',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Days:',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                '${date.day}',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ],
          ),
          Text(
            '${date.hour.toString()}:${date.minute.toString()}',
            style: TextStyle(fontSize: 100, color: Colors.white),
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kOrangeColor,
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Checkbox(
              value: false,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
