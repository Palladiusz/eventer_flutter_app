part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class ItemStateBase extends ItemState {
  final EventModel model;
  final String test;

  ItemStateBase({this.test = "test kek", this.model});

  ItemStateBase copyWith({EventModel model, String test}) {
    return ItemStateBase(model: model ?? this.model, test: test ?? this.test);
  }

  @override
  List<Object> get props => [model];
}

class ItemEditState extends ItemState {
  final String title;
  final String desc;
  final DateTime date;

  ItemEditState(this.title, this.desc, this.date);
}
