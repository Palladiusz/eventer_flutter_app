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
  FormItemDone(bool isValidate);
}

class FormItemEditingTitleState extends FormItemState {
  final String title;

  FormItemEditingTitleState(this.title);
}

class FormItemEditingDescState extends FormItemState {
  final String desc;

  FormItemEditingDescState(this.desc);
}

class FormItemEditingDateState extends FormItemState {
  final DateTime date;

  FormItemEditingDateState(this.date);
}

class FormItemEditingValidate extends FormItemState {
  final bool isValidate;

  FormItemEditingValidate(this.isValidate);
}
