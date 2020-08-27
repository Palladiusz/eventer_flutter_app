part of 'list_bloc.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class ListInitial extends ListState {}

class ListLoaded extends ListState {
  final List<EventModel> eventsList;

  ListLoaded(this.eventsList);

  @override
  List<Object> get props => [eventsList];
}
