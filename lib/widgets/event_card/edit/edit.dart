import 'package:eventer/blocs/item_bloc/item_bloc.dart';
import 'package:eventer/screens/home_screen_provider.dart';
import 'package:eventer/widgets/event_card/edit/edit_date.dart';
import 'package:eventer/widgets/event_card/edit/edit_desc.dart';
import 'package:eventer/widgets/event_card/edit/edit_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditWidget extends StatelessWidget {
  EditWidget({Key key, this.title, this.desc, this.date}) : super(key: key);
  final String title;
  final String desc;
  final DateTime date;
  final descController = TextEditingController();
  final titleController = TextEditingController();
  DateTime dateController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        EditTitle(
          myController: titleController,
        ),
        SizedBox(
          height: 10,
        ),
        // EditDate(
        //   myController: dateController,
        // ),
        SizedBox(
          height: 10,
        ),
        EditDesc(
          myController: descController,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            HomeScreenProvider()));
              },
            ),
            IconButton(
              icon: Icon(Icons.assignment_turned_in),
              onPressed: () {
                BlocProvider.of<ItemBloc>(context).add(ItemSubmitEditEvent(
                    title: titleController.text, desc: descController.text));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            HomeScreenProvider()));
              },
            ),
          ],
        ),
      ],
    );
  }
}
