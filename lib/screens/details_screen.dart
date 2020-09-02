import 'package:eventer/constants.dart';
import 'package:eventer/models/event_model.dart';
import 'package:eventer/widgets/details_screen/date_form.dart';
import 'package:eventer/widgets/details_screen/desc_form.dart';
import 'package:eventer/widgets/details_screen/submit_form_button.dart';
import 'package:eventer/widgets/details_screen/title_form.dart';
import 'package:eventer/widgets/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final EventModel model;

  static const String id = '/details_screen';

  const DetailsScreen({Key key, this.model}) : super(key: key);

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
                TitleForm(),
                SizedBox(
                  height: 40,
                ),
                DescForm(initialValue: model?.desc),
                SizedBox(
                  height: 70,
                ),
                DateForm(),
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
