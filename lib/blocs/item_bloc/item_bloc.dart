import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/services/eventer_services.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc({this.model}) : super(ItemInitial());

  final EventModel model;
  var _eventerServices = EventerServices();
  StreamSubscription<int> _tickerSubscription;
  int duration = 60;

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    if (event is ItemTicked) {
      yield await _mapItemsDatetoTimeStates(model.date);
    } else if (event is ItemTimerStartEvent) {
      _mapTimerStartedToState(duration);
    }
  }

  Future<ItemTimeState> _mapItemsDatetoTimeStates(DateTime date) async {
    DateTime date;
    DateTime now = DateTime.now();

    return ItemTimeState(
      days: date.difference(now).inDays,
      hours: date.difference(now).inHours % 24,
      minutes: date.difference(now).inMinutes % 60,
      seconds: date.difference(now).inSeconds % 60,
    );
  }

  Stream<LoadItemsEvent> _mapTimerStartedToState(int start) async* {
    _tickerSubscription?.cancel();
    _tickerSubscription = _eventerServices.tick(ticks: start).listen(
          (duration) => add(
            ItemTicked(duration: duration),
          ),
        );
  }
}
