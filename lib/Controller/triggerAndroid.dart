import 'package:flutter/services.dart';

abstract class TriggerAndroid {
  Future<bool> showNotification(String email);
  bool validateAndSave(formKey);
}

class BaseTrigger implements TriggerAndroid {

  static const _platform = const MethodChannel("Notifications");
  bool androidResult = false;


  Future<bool> showNotification(String email) async {
    print("Show notification method invoked in flutter");
    bool androidResult = await _platform
        .invokeMethod("showAndroidNotification", {"text": email});
    print("$androidResult..........................................");
    return androidResult;
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
