part of 'form_item_bloc.dart';

abstract class FormItemState extends Equatable {
  const FormItemState();

  @override
  List<Object> get props => [];
}

class FormItemInitial extends FormItemState {
  FormItemInitial();
}

class FormItemDone extends FormItemState {
  FormItemDone();
}
