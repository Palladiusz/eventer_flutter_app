import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_item_event.dart';
part 'form_item_state.dart';

class FormItemBloc extends Bloc<FormItemEvent, FormItemState> {
  FormItemBloc() : super(FormItemInitial());

  @override
  Stream<FormItemState> mapEventToState(
    FormItemEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
