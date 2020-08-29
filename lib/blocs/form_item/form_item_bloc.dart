import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/services/eventer_services.dart';

part 'form_item_event.dart';
part 'form_item_state.dart';

class FormItemBloc extends Bloc<FormItemEvent, FormItemState> {
  FormItemBloc(this.model) : super(FormItemInitial());
  var _eventerServices = EventerServices();
  final EventModel model;

  @override
  Stream<FormItemState> mapEventToState(
    FormItemEvent event,
  ) async* {
    if (event is FormItemUpdateTitleEvent) {
      yield FormItemEditingState(title: event.title);
      print(event.title);
      model.title = event.title;
    } else if (event is FormItemUpdateDescEvent) {
      yield FormItemEditingState(desc: event.desc);
      print(event.desc);
      model.desc = event.desc;
    } else if (event is FormItemUpdateDateEvent) {
      yield FormItemEditingState(date: event.date);
      print(event.date.toIso8601String());
      model.date = event.date;
    } else if (event is FormItemAddEvent) {
      _eventerServices.postEvent(
        title: model.title,
        desc: model.desc ?? '',
        dateString: model.date.toIso8601String(),
      );
    }
  }
}
