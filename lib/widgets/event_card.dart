import 'dart:async';

import 'package:eventer/blocs/item_bloc/item_bloc.dart';
import 'package:eventer/constants.dart';
import 'package:eventer/services/eventer_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCard extends StatelessWidget {
  const EventCard();

  @override
  Widget build(BuildContext context) {
    var _eventerServices = EventerServices();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: kDarkBlue,
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [kVeryDarkBlue, kDarkBlue]),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xff1a1a2e),
            offset: Offset(6, 6),
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 20),
      width: 350,
      child: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemTimeState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  state.model.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                Text(
                  state.model.desc,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Time to start event:',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BlocBuilder<ItemBloc, ItemState>(
                  builder: (context, state) {
                    if (state is ItemTimeState) {
                      print(state.days);
                      return Text(
                        '${state.days}, ${state.minutes} ${state.seconds}',
                        //'${date.difference(DateTime.now()).inDays}d ${date.difference(DateTime.now()).inHours % 24}h ${date.difference(DateTime.now()).inMinutes % 60}m ${date.difference(DateTime.now()).inSeconds % 60}s',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: kLightBlue,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff1a1a2e),
                        offset: Offset(6, 6),
                      ),
                    ],
                  ),
                  child: Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
