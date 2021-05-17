import 'package:flutter/material.dart';
import 'package:tz_profile/screens/log_in_screen.dart';

void main() {
  runApp(
    App(),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tz_profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogInPage(),
    );
  }
}
