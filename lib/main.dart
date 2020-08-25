import 'package:eventer/screens/details_screen.dart';
import 'package:eventer/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.topLeft,
        depth: -15,
      ),
      darkTheme: NeumorphicThemeData(
          appBarTheme: NeumorphicAppBarThemeData(
            iconTheme: IconThemeData(color: Colors.white),
            buttonStyle: NeumorphicStyle(
              depth: 1,
              intensity: 0.9,
              lightSource: LightSource.top,
            ),
          ),
          baseColor: Colors.grey[800],
          lightSource: LightSource.topLeft,
          depth: -3,
          intensity: 0.8,
          defaultTextColor: Colors.yellowAccent),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        DetailsScreen.id: (context) => DetailsScreen(),
      },
    );
  }
}
