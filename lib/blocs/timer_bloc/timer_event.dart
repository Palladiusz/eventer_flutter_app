part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

class ItemTimerStartEventt extends TimerEvent {}

class ItemTicked extends TimerEvent {
  final int duration;

  ItemTicked({this.duration});
}
