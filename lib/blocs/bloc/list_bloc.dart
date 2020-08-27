import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/services/eventer_services.dart';
import 'package:eventer/widgets/event_card.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  var _eventerServices = EventerServices();

  ListBloc() : super(ListLoaded([]));

  @override
  Stream<ListState> mapEventToState(
    ListEvent event,
  ) async* {
    //TODO: State should return viewModel not widget
    yield ListLoaded(await _eventerServices.fetchData());
  }
}
