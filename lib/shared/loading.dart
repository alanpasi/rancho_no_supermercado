import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.deepPurpleAccent,
        brightness: Brightness.dark,
      ),
      home: Container(
        color: Colors.deepPurple,
        child: Center(
          child: SpinKitChasingDots(
            color: Colors.grey,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
