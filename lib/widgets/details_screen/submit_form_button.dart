import 'package:eventer/services/eventer_services.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SubmitFormButton extends StatelessWidget {
  const SubmitFormButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        'Submit event',
        style: TextStyle(color: Colors.white),
      ),
      color: kVeryDarkBlue,
      onPressed: () {},
    );
  }
}
