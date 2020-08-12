import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mill_app/detailspage.dart';

import 'homepage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  runApp(MillApp());
}

class MillApp extends StatefulWidget {
  @override
  _MillAppState createState() => _MillAppState();
}

class _MillAppState extends State<MillApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        DetailPage.id: (context) => DetailPage()
      },
    );
  }
}
