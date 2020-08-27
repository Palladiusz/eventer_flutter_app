import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/services/eventer_services.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial());
  var _eventerServices = EventerServices();
  StreamSubscription<int> _tickerSubscription;

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    if (event is LoadItemsEvent) {
      EventModel item = event.model;
      yield ItemLoadedState(
        id: item.id,
        checkedOut: item.checkedOut,
        date: item.date,
        desc: item.desc,
        title: item.title,
      );
      _mapItemsDatetoTimeStates(item.date);
    }
  }

  Stream<ItemTimeState> _mapItemsDatetoTimeStates(DateTime date) async* {
    DateTime date;
    DateTime now = DateTime.now();

    yield ItemTimeState(
      days: date.difference(now).inDays,
      hours: date.difference(now).inHours % 24,
      minutes: date.difference(now).inMinutes % 60,
      seconds: date.difference(now).inSeconds % 60,
    );
  }
}
