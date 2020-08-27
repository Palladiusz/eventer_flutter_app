import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/services/eventer_services.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  var _eventerServices = EventerServices();

  ListBloc() : super(ListLoaded([]));

  @override
  Stream<ListState> mapEventToState(
    ListEvent event,
  ) async* {
    yield ListLoaded(await _eventerServices.fetchData());
  }
}
