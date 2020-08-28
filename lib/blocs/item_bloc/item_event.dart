part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class LoadItemsEvent extends ItemEvent {
  final EventModel model;

  LoadItemsEvent(this.model);
}

class ItemTicked extends ItemEvent {
  final int duration;

  ItemTicked({this.duration});
}

class ItemTimerStartEvent extends ItemEvent {}

class ItemCheckEvent extends ItemEvent {}
