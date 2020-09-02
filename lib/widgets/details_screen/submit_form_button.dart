import 'package:eventer/blocs/form_item/form_item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../screens/home_screen_provider.dart';

import '../../constants.dart';

class SubmitFormButton extends StatelessWidget {
  const SubmitFormButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      initialData: false,
      stream: BlocProvider.of<FormItemBloc>(context).isValid,
      builder: (context, snapshot) {
        final isValid = snapshot.hasData && snapshot.data;
        return RaisedButton(
          child: Text(
            'Submit event',
            style: TextStyle(color: isValid ? Colors.white : Colors.redAccent),
          ),
          color: kVeryDarkBlue,
          onPressed: isValid
              ? () {
                  BlocProvider.of<FormItemBloc>(context).add(
                    FormItemAddEvent(),
                  );

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              HomeScreenProvider()));
                }
              : null,
        );
      },
    );
  }
}
