import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_vendor/login_page.dart';
import 'package:food_ordering_vendor/promocode.dart';

import 'overview.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black, // status bar color
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Overview(),
      debugShowCheckedModeBanner: false,
    );
  }
}
