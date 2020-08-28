import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/services/eventer_services.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final EventModel model;
  var _eventerServices = EventerServices();
  StreamSubscription<int> _tickerSubscription;
  int duration = 60;

  ItemBloc(this.model) : super(ItemInitial());

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    if (event is ItemTicked) {
      yield await _mapItemsDatetoTimeStates();
    } else if (event is ItemTimerStartEvent) {
      _mapTimerStartedToState(duration);
    }
  }

  Future<ItemTimeState> _mapItemsDatetoTimeStates() async {
    DateTime date = model.date;
    DateTime now = DateTime.now();

    return ItemTimeState(
        days: date.difference(now).inDays,
        hours: date.difference(now).inHours % 24,
        minutes: date.difference(now).inMinutes % 60,
        seconds: date.difference(now).inSeconds % 60,
        model: model);
  }

  void _mapTimerStartedToState(int start) {
    _tickerSubscription?.cancel();
    _tickerSubscription = _eventerServices.tick(ticks: start).listen((event) {
      add(ItemTicked(duration: event));
    });
  }
}
