import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer/services/eventer_services.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc({this.dateFromModel}) : super(TimerInitial());
  var _eventerServices = EventerServices();
  final DateTime dateFromModel;
  StreamSubscription<int> _tickerSubscription;

  @override
  Stream<TimerState> mapEventToState(
    TimerEvent event,
  ) async* {
    int durationInSeconds = dateFromModel.difference(DateTime.now()).inSeconds;

    if (event is ItemTicked) {
      yield await _mapItemsDatetoTimeStates();
    } else if (event is ItemTimerStartEventt) {
      if (durationInSeconds > 0) {
        _mapTimerStartedToState(durationInSeconds);
      } else {
        yield ItemTimeState(
          days: '0',
          hours: '00',
          minutes: '00',
          seconds: '00',
        );
      }
    }
  }

  Future<ItemTimeState> _mapItemsDatetoTimeStates() async {
    DateTime date = dateFromModel;
    DateTime now = DateTime.now();

    return ItemTimeState(
      days: date.difference(now).inDays.toString(),
      hours: _eventerServices.formatNum((date.difference(now).inHours % 24)),
      minutes:
          _eventerServices.formatNum((date.difference(now).inMinutes % 60)),
      seconds:
          _eventerServices.formatNum((date.difference(now).inSeconds % 60)),
    );
  }

  void _mapTimerStartedToState(int start) {
    _tickerSubscription?.cancel();
    _tickerSubscription = _eventerServices.tick(ticks: start).listen((event) {
      add(ItemTicked(duration: event));
    });
  }
}
