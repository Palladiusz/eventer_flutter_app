part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class LoadItemsEvent extends ItemEvent {}

class ItemCheckEvent extends ItemEvent {}

class ItemDeleteEvent extends ItemEvent {}

class ItemEditEvent extends ItemEvent {}

class ItemSubmitEditEvent extends ItemEvent {
  final String title;
  final String desc;

  ItemSubmitEditEvent({this.title, this.desc});
}
