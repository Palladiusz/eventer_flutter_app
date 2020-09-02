part of 'form_item_bloc.dart';

abstract class FormItemEvent extends Equatable {
  const FormItemEvent();

  @override
  List<Object> get props => [];
}

class FormItemStartEvent extends FormItemEvent {}

class FormItemAddEvent extends FormItemEvent {}
