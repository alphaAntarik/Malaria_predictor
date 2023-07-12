import 'package:flutter/material.dart';
import 'package:symptotrack/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sympto track',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(250, 250, 250, 1),
        fontFamily: 'Muli',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              color: Colors.black,
            ),
            subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/',
      routes: {'/': (context) => HomeScreen()},
    );
  }
}
