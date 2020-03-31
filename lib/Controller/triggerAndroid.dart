import 'package:flutter/services.dart';

abstract class TriggerAndroid {
  Future<void> showNotification();
}

class BaseTrigger implements TriggerAndroid {
  static const _platform = const MethodChannel("Notifications");

  Future<void> showNotification() async{
    print("Show notification method invoked in flutter");
    await _platform.invokeMethod("showAndroidNotification");
  }
}
