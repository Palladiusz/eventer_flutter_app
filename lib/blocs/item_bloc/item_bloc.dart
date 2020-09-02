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
      yield ItemStateBase(model: model);
    }

    if (event is ItemCheckEvent && state is ItemStateBase) {
      final newModel = model.copyWith(checkedOut: !model.checkedOut);
      _eventerServices.editEvent(
        isChecked: newModel.checkedOut,
        dateString: model.date.toIso8601String(),
        desc: model.desc,
        id: model.id,
        title: model.title,
      );
      model = newModel;
      yield (state as ItemStateBase).copyWith(model: newModel);
    }
    if (event is ItemDeleteEvent) {
      _eventerServices.deleteEvent(id: model.id);
    }
    if (event is ItemEditEvent) {
      yield ItemEditState(model.title, model.desc, model.date);
    }
  }
}
