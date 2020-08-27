import 'package:eventer/blocs/bloc/list_bloc.dart';
import 'package:eventer/constants.dart';
import 'package:eventer/screens/details_screen.dart';
import 'package:eventer/widgets/event_card.dart';
import 'package:eventer/widgets/my_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: 'Event List',
        ),
        body: Container(
          color: kMainBrownColor,
          child: BlocBuilder<ListBloc, ListState>(
            builder: (context, state) {
              if (state is ListLoaded) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: state.eventsList,
                );
              } else {
                return Container();
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[200],
          child: Icon(
            Icons.note_add,
            color: kOrangeColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsScreen()),
            );
          },
        ),
      ),
    );
  }
}
