import 'package:eventer/blocs/form_item/form_item_bloc.dart';
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
        if (state is FormItemEditingValidate) {
          bool isValidate = state.isValidate;
          return RaisedButton(
            child: Text(
              'Submit event',
              style: TextStyle(
                  color: isValidate ? Colors.white : Colors.redAccent),
            ),
            color: kVeryDarkBlue,
            onPressed: isValidate
                ? () {
                    BlocProvider.of<FormItemBloc>(context).add(
                      FormItemAddEvent(),
                    );
                  }
                : null,
          );
        } else {
          return RaisedButton(
            child: Text(
              'Submit event',
              style: TextStyle(color: Colors.redAccent),
            ),
            color: kVeryDarkBlue,
            onPressed: null,
          );
        }
      },
    );
  }
}
