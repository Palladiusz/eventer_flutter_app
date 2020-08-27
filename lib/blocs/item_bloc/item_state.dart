part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class ItemLoadedState extends ItemState {
  final int id;
  final String title;
  final String desc;
  final DateTime date;
  final bool checkedOut;

  ItemLoadedState({this.id, this.title, this.desc, this.date, this.checkedOut});

  @override
  List<Object> get props => [id, title, desc, date, checkedOut];
}

class ItemTimeState extends ItemState {
  final int hours;
  final int days;
  final int minutes;
  final int seconds;

  ItemTimeState({this.hours, this.days, this.minutes, this.seconds});

  @override
  List<Object> get props => [hours, days, minutes, seconds];
}
