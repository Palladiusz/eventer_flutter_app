import 'package:eventer/blocs/form_item/form_item_bloc.dart';
import 'package:eventer/constants.dart';
import 'package:eventer/services/eventer_services.dart';
import 'package:eventer/widgets/details_screen/date.form.dart';
import 'package:eventer/widgets/details_screen/desc_form.dart';
import 'package:eventer/widgets/details_screen/submit_form_button.dart';
import 'package:eventer/widgets/details_screen/title_form.dart';
import 'package:eventer/widgets/my_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  static const String id = '/details_screen';
  final descController = TextEditingController();
  final titleController = TextEditingController();

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
                TitleForm(myController: titleController),
                SizedBox(
                  height: 40,
                ),
                DescForm(myController: descController),
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
