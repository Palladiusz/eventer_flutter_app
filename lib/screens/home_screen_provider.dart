import 'package:eventer/blocs/list_bloc/list_bloc.dart';
import 'package:eventer/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenProvider extends StatelessWidget {
  static const String id = '/home_screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListBloc>(
      create: (BuildContext context) => ListBloc()
        ..add(
          ListLoad(),
        ),
      child: HomeScreen(),
    );
  }
}
