part of 'form_item_bloc.dart';

abstract class FormItemState extends Equatable {
  const FormItemState();

  @override
  List<Object> get props => [];
}

class FormItemInitial extends FormItemState {}

class FormItemEditingState extends FormItemState {
  final String title;
  final String desc;
  final DateTime date;

  FormItemEditingState({this.title, this.desc, this.date});
}

class FormItemDone extends FormItemState {}
