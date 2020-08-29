part of 'form_item_bloc.dart';

abstract class FormItemEvent extends Equatable {
  const FormItemEvent();

  @override
  List<Object> get props => [];
}

class FormItemUpdateTitleEvent extends FormItemEvent {
  final String title;

  FormItemUpdateTitleEvent(this.title);
}

class FormItemUpdateDescEvent extends FormItemEvent {
  final String desc;

  FormItemUpdateDescEvent(this.desc);
}

class FormItemUpdateDateEvent extends FormItemEvent {
  final DateTime date;

  FormItemUpdateDateEvent(this.date);
}

class FormItemAddEvent extends FormItemEvent {}
