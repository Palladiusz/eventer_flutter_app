import 'dart:async';
import 'dart:convert';

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
    yield ListLoaded(await _loadListofEventCards());
  }

  Future<List<EventCard>> _loadListofEventCards() async {
    List<dynamic> data = await _eventerServices.fetchData();

    return data.map((event) {
      var json = EventModel.fromJson(event);
      print(json.date);
      return EventCard(
        title: json.title,
        desc: json.desc,
        date: json.date,
        checkedOut: json.checkedOut,
      );
    }).toList();
  }
}
