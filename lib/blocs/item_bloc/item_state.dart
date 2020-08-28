part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class ItemTimeState extends ItemState {
  final String hours;
  final String days;
  final String minutes;
  final String seconds;
  final EventModel model;

  ItemTimeState(
      {this.hours, this.days, this.minutes, this.seconds, this.model});

  @override
  List<Object> get props => [hours, days, minutes, seconds];
}
