import 'package:eventer/blocs/form_item/form_item_bloc.dart';
import 'package:eventer/services/eventer_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class SubmitFormButton extends StatelessWidget {
  const SubmitFormButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormItemBloc, FormItemState>(
      builder: (context, state) {
        return RaisedButton(
          child: Text(
            'Submit event',
            style: TextStyle(color: Colors.white),
          ),
          color: kVeryDarkBlue,
          onPressed: () {
            if (state is FormItemEditingState) {
              BlocProvider.of<FormItemBloc>(context).add(
                FormItemAddEvent(),
              );
            }
          },
        );
      },
    );
  }
}
