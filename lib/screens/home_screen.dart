import 'package:eventer/constants.dart';
import 'package:eventer/widgets/event_card.dart';
import 'package:eventer/widgets/my_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: 'Event List',
        ),
        body: Container(
          color: kMainBrownColor,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              EventCard(
                date: DateTime.now(),
                title: 'Test1',
                desc: 'kjhkjsjjjjjjj',
              ),
              EventCard(
                date: DateTime.now(),
                title: 'Test1',
                desc: 'kjhkjsjjjjjjj',
              ),
              EventCard(
                date: DateTime.now(),
                title: 'Test1',
                desc: 'kjhkjsjjjjjjj',
              )
            ],
          ),
        ),
      ),
    );
  }
}
