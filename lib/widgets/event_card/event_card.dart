import 'package:eventer/blocs/item_bloc/item_bloc.dart';
import 'package:eventer/constants.dart';
import 'package:eventer/widgets/event_card/checkbox_widget.dart';
import 'package:eventer/widgets/event_card/desc_event.dart';
import 'package:eventer/widgets/event_card/timer_bloc_widget.dart';
import 'package:eventer/widgets/event_card/title.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventCard extends StatelessWidget {
  const EventCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kDarkBlue,
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [kVeryDarkBlue, kOtherBlue]),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color(0xff1a1a2e),
            offset: Offset(6, 6),
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 5),
      width: 350,
      child: ExpandableNotifier(
        child: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            if (state is ItemTimeState) {
              return Expandable(
                collapsed: ExpandableButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 300,
                        child: Column(
                          children: [
                            TitleEvent(title: state.model.title),
                            TimerBlocWidget(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      CheckBoxWidget(checkedOut: state.model.checkedOut),
                    ],
                  ),
                ),
                expanded: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TitleEvent(
                      title: state.model.title,
                      isExpanded: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TimerBlocWidget(),
                    SizedBox(
                      height: 10,
                    ),
                    DescEvent(desc: state.model.desc),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ExpandableButton(child: Icon(Icons.keyboard_arrow_up)),
                        CheckBoxWidget(checkedOut: state.model.checkedOut),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.edit), onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.delete_forever),
                                onPressed: () {}),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                child: Text(
                  'Loading...',
                  textAlign: TextAlign.center,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
