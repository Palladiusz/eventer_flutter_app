import 'package:eventer/blocs/item_bloc/item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBlocWidget extends StatelessWidget {
  const TimerBlocWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
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
    );
  }
}
