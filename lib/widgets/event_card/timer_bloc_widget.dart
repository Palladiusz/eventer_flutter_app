import 'package:eventer/blocs/timer_bloc/timer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBlocWidget extends StatelessWidget {
  const TimerBlocWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) {
        if (state is ItemTimeState) {
          return Text(
            '${state.days}d ${state.hours}:${state.minutes}:${state.seconds}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
