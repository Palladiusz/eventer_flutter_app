part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState();

  @override
  List<Object> get props => [];
}

class TimerInitial extends TimerState {}

class ItemTimeState extends TimerState {
  final String hours;
  final String days;
  final String minutes;
  final String seconds;

  ItemTimeState({
    this.hours,
    this.days,
    this.minutes,
    this.seconds,
  });

  ItemTimeState copyWith({
    String hours,
    String days,
    String minutes,
    String seconds,
  }) {
    return ItemTimeState(
      hours: hours ?? this.hours,
      days: days ?? this.days,
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
    );
  }

  @override
  List<Object> get props => [hours, days, minutes, seconds];
}
