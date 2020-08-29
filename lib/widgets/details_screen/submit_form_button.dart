import 'package:eventer/services/eventer_services.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SubmitFormButton extends StatelessWidget {
  const SubmitFormButton({
    Key key,
    @required EventerServices eventerServices,
  })  : _eventerServices = eventerServices,
        super(key: key);

  final EventerServices _eventerServices;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        'Submit event',
        style: TextStyle(color: Colors.white),
      ),
      color: kVeryDarkBlue,
      onPressed: () {
        _eventerServices.fetchData();
      },
    );
  }
}
