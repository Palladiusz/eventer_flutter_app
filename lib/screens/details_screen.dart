import 'package:eventer/blocs/form_item/form_item_bloc.dart';
import 'package:eventer/constants.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/widgets/details_screen/date_form.dart';
import 'package:eventer/widgets/details_screen/desc_form.dart';
import 'package:eventer/widgets/details_screen/submit_form_button.dart';
import 'package:eventer/widgets/details_screen/title_form.dart';
import 'package:eventer/widgets/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  static const String id = '/details_screen';

  const DetailsScreen();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: 'Create New Event',
        ),
        backgroundColor: kDarkBlue,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TitleForm(
                  initialValue:
                      BlocProvider.of<FormItemBloc>(context).titleField.value,
                ),
                SizedBox(
                  height: 40,
                ),
                DescForm(
                  initialValue:
                      BlocProvider.of<FormItemBloc>(context).descField.value,
                ),
                SizedBox(
                  height: 70,
                ),
                DateForm(
                  initDate:
                      BlocProvider.of<FormItemBloc>(context).dateField.value,
                ),
                SizedBox(
                  height: 60,
                ),
                SubmitFormButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
