part of 'list_bloc.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object> get props => [];
}

class ListLoading extends ListEvent {}

class ListLoad extends ListEvent {}
