import 'package:eventer/blocs/item_bloc/item_bloc.dart';
import 'package:eventer/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCard extends StatelessWidget {
  const EventCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: kMinorBrownColor,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 20),
      width: 350,
      child: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemLoadedState) {
            return Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  state.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  state.desc,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 70,
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
                Text(
                  ';;',
                  //'${date.difference(DateTime.now()).inDays}d ${date.difference(DateTime.now()).inHours % 24}h ${date.difference(DateTime.now()).inMinutes % 60}m ${date.difference(DateTime.now()).inSeconds % 60}s',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
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
