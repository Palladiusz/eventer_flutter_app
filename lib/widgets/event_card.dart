import 'package:eventer/blocs/item_bloc/item_bloc.dart';
import 'package:eventer/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCard extends StatelessWidget {
  const EventCard();

  @override
  Widget build(BuildContext context) {
    return Container(
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
      margin: EdgeInsets.only(top: 5),
      width: 350,
      child: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemTimeState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 70,
                  child: Column(
                    children: [
                      Text(
                        state.model.title,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      // Text(
                      //   state.model.desc,
                      //   textAlign: TextAlign.center,
                      //   overflow: TextOverflow.ellipsis,
                      //   maxLines: 6,
                      //   style: TextStyle(
                      //     fontSize: 8,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<ItemBloc, ItemState>(
                  builder: (context, state) {
                    if (state is ItemTimeState) {
                      return Text(
                        '${state.days}:${state.hours}:${state.minutes}:${state.seconds}',
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
                  width: 40,
                  height: 40,
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
                    value: state.model.checkedOut,
                    onChanged: (value) {
                      BlocProvider.of<ItemBloc>(context).add(ItemCheckEvent());
                    },
                  ),
                ),
              ],
            );
          } else {
            return Container(
              child: Text(
                'Loading...',
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
