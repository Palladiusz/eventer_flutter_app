import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/services/eventer_services.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc(this.model) : super(ItemInitial());
  final EventModel model;
  var _eventerServices = EventerServices();
  StreamSubscription<int> _tickerSubscription;

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    if (event is LoadItemsEvent) {
      yield ItemStateBase(model: model);
    }

    if (event is ItemCheckEvent) {
      // TODO work checkbox on finished events
      yield ItemStateBase()
          .copyWith(model: model.copyWith(checkedOut: _switchCheckbox(false)));
      print(model.checkedOut);
    }
    if (event is ItemDeleteEvent) {
      //TODO
      _eventerServices.deleteEvent();
    }
    if (event is ItemEditEvent) {
      //TODO
    }
  }

  bool _switchCheckbox(bool check) {
    return (check ? check = false : check = true);
  }
}
