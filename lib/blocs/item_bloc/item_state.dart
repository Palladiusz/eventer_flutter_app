part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class ItemStateBase extends ItemState {
  final EventModel model;

  ItemStateBase({this.model});

  ItemStateBase copyWith({EventModel model}) {
    return ItemStateBase(model: model ?? this.model);
  }

  @override
  List<Object> get props => [model];
}

class ItemCheckboxState extends ItemState {
  final bool isChecked;

  ItemCheckboxState({this.isChecked});
}

class ItemEditState extends ItemState {
  final String title;
  final String desc;
  final DateTime date;

  ItemEditState(this.title, this.desc, this.date);
}
