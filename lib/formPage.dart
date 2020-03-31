import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Controller/triggerAndroid.dart';
class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  //Trigger OBJ
  TriggerAndroid _triggerAndroid= new BaseTrigger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Screen'),
      ),
      body: Center(
        child: FlatButton(
          color: Colors.indigo[300],
          //Call for notification
          onPressed: _triggerAndroid.showNotification,
          child: Text(
            "Press to invoke native"
          ),

        ),
      ),
    );
  }
}
