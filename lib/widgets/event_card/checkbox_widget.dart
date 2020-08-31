import 'package:eventer/blocs/item_bloc/item_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool checkedOut;
  const CheckBoxWidget({
    Key key,
    this.checkedOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: kLightBlue,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff1a1a2e),
            offset: Offset(6, 6),
          ),
        ],
      ),
      child: Checkbox(
        value: checkedOut,
        onChanged: (value) {
          BlocProvider.of<ItemBloc>(context).add(ItemCheckEvent());
        },
      ),
    );
  }
}
