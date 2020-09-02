import 'package:eventer/blocs/form_item/form_item_bloc.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  final EventModel model;

  const DetailsPage({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FormItemBloc>(
      create: (ctx) => FormItemBloc(model)..add(FormItemStartEvent()),
      child: DetailsScreen(),
    );
  }
}
