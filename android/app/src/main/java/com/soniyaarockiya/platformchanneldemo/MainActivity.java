package com.soniyaarockiya.platformchanneldemo;

import android.os.Bundle;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.view.FlutterView;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "Notifications";



    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {


                            if (call.method.equals("showAndroidNotification")) {
                                Toast.makeText(getApplicationContext(),"Hello from Android",Toast.LENGTH_LONG).show();
                            } else {

                                result.notImplemented();
                            }
                        }
                );
    }


}
