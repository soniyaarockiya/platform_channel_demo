package com.soniyaarockiya.platformchanneldemo;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.os.Build;
import android.os.Bundle;
import android.os.PersistableBundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    //Constant Values
    private static final String CHANNEL = "Notifications";
    private static final String CHANNEL_ID = "personal_notifications";
    private static final int NOTIFICATION_ID =100;


    @Override
    public void onCreate(@Nullable Bundle savedInstanceState, @Nullable PersistableBundle persistentState) {
        super.onCreate(savedInstanceState, persistentState);


    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("showAndroidNotification")) {
                               //Show notification
                                displayNotification();
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }


    public void displayNotification(){

        //call createNotification to check the SDK version and accordingly create notification if needed
        createNotificationChannel();

        NotificationCompat.Builder builder = new NotificationCompat.Builder(this,CHANNEL_ID);

        //set notification icon, priority, title and text
        builder.setSmallIcon(R.drawable.notifications);
        builder.setContentTitle("Success!");
        builder.setContentText(" Your form has been successfully Submitted");
        builder.setPriority(NotificationCompat.PRIORITY_DEFAULT);


        try{
            NotificationManagerCompat notificationManagerCompat= NotificationManagerCompat.from(this);
            notificationManagerCompat.notify(NOTIFICATION_ID,builder.build());

        } catch (Exception e) {
            e.printStackTrace();
        }


    }


    // Notification channel is need for Android 8.0 and above
        private void createNotificationChannel() {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            CharSequence name = " Personal Notifications";
            String description = "Include all personal notifications";
            int importance = NotificationManager.IMPORTANCE_DEFAULT;

            NotificationChannel notificationChannel = new NotificationChannel(CHANNEL_ID, name, importance);
            notificationChannel.setDescription(description);

            NotificationManager notificationManager = (NotificationManager) getSystemService(NOTIFICATION_SERVICE);


            try{
                notificationManager.createNotificationChannel(notificationChannel);
            } catch (Exception e) {
                e.printStackTrace();
            }


        }


    }
}
