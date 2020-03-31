import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Controller/triggerAndroid.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = new GlobalKey<FormState>();

  String email;
  String password;

  //Trigger obj
  TriggerAndroid _triggerAndroid = new BaseTrigger();

  void _formSubmission() async {
    if (_triggerAndroid.validateAndSave(formKey)) {
      setState(() {
        formKey.currentState.reset();
      });
      await _triggerAndroid.showNotification();

      //clear form after submission

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Flutter Screen'),
        centerTitle: true,
      ),
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
//                  labelText: "Enter your email"
                ),
                validator: (value) =>
                    value.isEmpty ? 'Email cant be empty' : null,
                onSaved: (value) => email = value,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
//                    labelText: "Enter your email",
                  hintText: "Password",
                ),
                validator: (value) =>
                    value.isEmpty ? 'pass word cant be empty' : null,
                onSaved: (value) => password = value,
              ),
              RaisedButton(
                onPressed: _formSubmission,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20.0,
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
