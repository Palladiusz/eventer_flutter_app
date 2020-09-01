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
      yield FormItemEditingTitleState(event.title);
      print(event.title);
      model.copyWith(title: event.title);
      _getTitle(model.title, event.title);
      model.title = event.title;
      print(model.title);
    } else if (event is FormItemUpdateDescEvent) {
      yield FormItemEditingDescState(event.desc);
      print(event.desc);
      model.desc = event.desc;
      model.copyWith(title: event.desc);
    } else if (event is FormItemUpdateDateEvent) {
      yield FormItemEditingDateState(event.date);
      model.copyWith(date: event.date);
      model.date = event.date;
    } else if (event is FormItemAddEvent) {
      _eventerServices.postEvent(
        title: model.title,
        desc: model.desc ?? '',
        dateString: model.date.toIso8601String(),
      );
    }
    yield FormItemEditingValidate(_validation());
  }

  bool _validation() =>
      model.title.runtimeType == String &&
      model.title != '' &&
      model.date.runtimeType == DateTime;
  String _getTitle(title, value) => title = value;
}
