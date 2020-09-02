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
  FormItemBloc(this.model) : super(FormItemInitial()) {
    titleField = BehaviorBlocField<String>();
    if (model?.title?.isNotEmpty ?? false) {
      titleField.emit(model.title);
    }

    if (model?.desc?.isNotEmpty ?? false) {
      descField.emit(model.desc);
    }

    if (model?.date != null) {
      dateField.emit(model.date);
    }
  }
  var _eventerServices = EventerServices();

  BehaviorBlocField<String> titleField;
  final descField = BehaviorBlocField<String>();
  final dateField = BehaviorBlocField<DateTime>();

  Stream<bool> get isValid =>
      Rx.combineLatest3(titleField.stream, descField.stream, dateField.stream,
          (String title, String desc, DateTime date) {
        return title?.isNotEmpty == true &&
            desc?.isNotEmpty == true &&
            date != null;
      });

  final EventModel model;

  @override
  Stream<FormItemState> mapEventToState(
    FormItemEvent event,
  ) async* {
    if (event is FormItemAddEvent) {
      _eventerServices.postEvent(
        title: titleField.value,
        desc: descField.value ?? '',
        dateString: dateField.value.toIso8601String(),
      );
      yield FormItemDone();
    } else {
      yield FormItemInitial();
    }
  }
}
