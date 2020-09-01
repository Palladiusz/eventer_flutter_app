import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer/blocs/list_bloc/list_bloc.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/services/eventer_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      _switchCheckbox(model.checkedOut);
      _eventerServices.editEvent(
          model: model.copyWith(checkedOut: model.checkedOut));
      yield ItemStateBase()
          .copyWith(model: model.copyWith(checkedOut: model.checkedOut));
      print(model.checkedOut);
    }
    if (event is ItemDeleteEvent) {
      //TODO
      _eventerServices.deleteEvent(id: model.id);
    }
    if (event is ItemEditEvent) {
      //TODO
      _eventerServices.editEvent(model: model.copyWith(desc: 'mememmee'));
    }
  }

  void _switchCheckbox(bool check) {
    check ? check = false : check = true;
  }
}
