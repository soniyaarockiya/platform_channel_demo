import 'package:flutter/material.dart';
import 'Controller/triggerAndroid.dart';

//REFERENCE :
//https://flutter.dev/docs/development/platform-integration/platform-channels
// https://www.youtube.com/watch?v=pwulMxlhdw8  ------- platform channel with android toast
//https://www.youtube.com/watch?v=Qo2IxY9eDhw  ------- android notifications with channel for android 8.0 and above


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String email;
  String password;
  var _valueFromShowNotification = true;
  TriggerAndroid _triggerAndroid = new BaseTrigger();

  void _formSubmission() async {
    if (_triggerAndroid.validateAndSave(formKey)) {
      var result = await _triggerAndroid.showNotification(email);
      setState(() {
        formKey.currentState.reset();
        _valueFromShowNotification = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                validator: (value) =>
                    value.isEmpty ? 'Email cant be empty' : null,
                onSaved: (value) => email = value,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                validator: (value) =>
                    value.isEmpty ? 'Password cant be empty' : null,
                onSaved: (value) => password = value,
              ),
              Builder(
                builder: (context) => RaisedButton(
                  onPressed: () {
                    //First validate the form
                    _formSubmission();

                    //Show snackBar if native side sends bool true after displaying notification
                    if (_valueFromShowNotification) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text("Yay ! A snack bar"),
                        duration: Duration(seconds: 5),
                      ));
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
