import 'package:flutter/services.dart';

abstract class TriggerAndroid {
  Future<void> showNotification();
  bool validateAndSave(formKey);
}

class BaseTrigger implements TriggerAndroid {
  static const _platform = const MethodChannel("Notifications");

  Future<void> showNotification() async{
    print("Show notification method invoked in flutter");
    await _platform.invokeMethod("showAndroidNotification");
  }


  bool validateAndSave(formKey) {
    final form = formKey.currentState;
    if (form.validate()) {
      //if you don't save the form , it returns null for both email and password
      form.save();
      return true;
    } else {
      return false;
    }
  }





}
