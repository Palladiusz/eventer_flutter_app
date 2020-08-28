import 'package:eventer/constants.dart';
import 'package:eventer/screens/details_screen.dart';
import 'package:eventer/screens/home_screen_provider.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: kVeryDarkBlue,
        accentColor: kDarkBlue,
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      initialRoute: HomeScreenProvider.id,
      routes: {
        HomeScreenProvider.id: (context) => HomeScreenProvider(),
        DetailsScreen.id: (context) => DetailsScreen(),
      },
    );
  }
}
