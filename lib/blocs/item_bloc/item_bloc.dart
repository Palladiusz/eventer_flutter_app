import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/services/eventer_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc(this.model) : super(ItemInitial());

  EventModel model;
  var _eventerServices = EventerServices();

  @override
  Stream<ItemState> mapEventToState(
    ItemEvent event,
  ) async* {
    if (event is LoadItemsEvent) {
      yield ItemStateBase(model: model, test: "kek nie test");
    }

    if (event is ItemCheckEvent && state is ItemStateBase) {
      // TODO work checkbox on finished events
      final newModel = model.copyWith(checkedOut: !model.checkedOut);
      _eventerServices.editEvent(model: newModel);
      model = newModel;
      yield (state as ItemStateBase).copyWith(model: newModel);
      print(newModel.checkedOut);
    }
    if (event is ItemDeleteEvent) {
      //TODO
      _eventerServices.deleteEvent(id: model.id);
    }
    if (event is ItemEditEvent) {
      //TODO
      // _eventerServices.editEvent(model: model.copyWith(desc: ));
      yield ItemEditState(model.title, model.desc, model.date);
    }
    if (event is ItemSubmitEditEvent) {
      _eventerServices.editEvent(
          model: model.copyWith(desc: event.desc, title: event.title));
    }
  }
}
