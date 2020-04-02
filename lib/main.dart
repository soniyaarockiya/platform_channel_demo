import 'package:flutter/material.dart';
import 'package:platformchanneldemo/formPage.dart';

//REFERENCE:
//https://flutter.dev/docs/development/platform-integration/platform-channels
// https://www.youtube.com/watch?v=pwulMxlhdw8  ------- platform channel with android toast
//https://www.youtube.com/watch?v=Qo2IxY9eDhw  ------- android notifications with channel for android 8.0 and above


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
        primaryColor: Color(0xff272936),
        accentColor: Color(0xff3d3f50),


      ),
      home: FormPage(),
    );
  }
}

