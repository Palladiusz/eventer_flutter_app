import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer/blocs/bloc_field.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/services/eventer_services.dart';
import 'package:rxdart/rxdart.dart';

part 'form_item_event.dart';
part 'form_item_state.dart';

class FormItemBloc extends Bloc<FormItemEvent, FormItemState> {
  FormItemBloc({this.model}) : super(FormItemInitial()) {
    if (model != null) {
      titleField.onChanged(model.title);
      descField.onChanged(model.desc);
      dateField.onChanged(model.date);
    }
  }
  final EventModel model;
  var _eventerServices = EventerServices();
  final titleField = BehaviorBlocField<String>();
  final descField = BehaviorBlocField<String>();
  final dateField = BehaviorBlocField<DateTime>();

  Stream<bool> get isValid =>
      Rx.combineLatest3(titleField.stream, descField.stream, dateField.stream,
          (String title, String desc, DateTime date) {
        return title?.isNotEmpty == true &&
            desc?.isNotEmpty == true &&
            date != null;
      });

  @override
  Stream<FormItemState> mapEventToState(
    FormItemEvent event,
  ) async* {
    if (event is FormItemAddEvent) {
      if (model == null) {
        _eventerServices.postEvent(
          title: titleField.value,
          desc: descField.value ?? '',
          dateString: dateField.value.toIso8601String(),
        );
      } else {
        _eventerServices.editEvent(
          id: model.id,
          title: titleField.value,
          desc: descField.value ?? '',
          dateString: dateField.value.toIso8601String(),
        );
      }
      yield FormItemDone();
    } else {
      yield FormItemInitial();
    }
  }
}
