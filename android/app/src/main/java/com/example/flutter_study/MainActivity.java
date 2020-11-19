package com.example.flutter_demo;


import io.flutter.embedding.android.FlutterActivity;
//电池demo相关
//import io.flutter.app.FlutterActivity;
//import io.flutter.plugin.common.MethodCall;
//import io.flutter.plugin.common.MethodChannel;
//import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
//import io.flutter.plugin.common.MethodChannel.Result;
//import android.content.ContextWrapper;
//import android.content.Intent;
//import android.content.IntentFilter;
//import android.os.BatteryManager;
//import android.os.Build.VERSION;
//import android.os.Build.VERSION_CODES;
//import android.os.Bundle;

import androidx.annotation.NonNull;

public class MainActivity extends FlutterActivity {
//    private static final String CHANNEL = "samples.flutter.io/battery";
//    private static final String CHANNEL2 = "testMethod";
//
//    @Override
//    public void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
//                new MethodCallHandler() {
//                    @Override
//                    public void onMethodCall(MethodCall call, Result result) {
//                        if (call.method.equals("getBatteryLevel")) {
//                            int batteryLevel = getBatteryLevel();
//
//                            if (batteryLevel != -1) {
//                                result.success(batteryLevel);
//                            } else {
//                                result.error("UNAVAILABLE", "Battery level not available.", null);
//                            }
//                        } else {
//                            result.notImplemented();
//                        }
//                    }
//                });
//        new MethodChannel(getFlutterView(),CHANNEL2).setMethodCallHandler(new MethodCallHandler() {
//            @Override
//            public void onMethodCall( MethodCall call,  Result result) {
//                if(call.method.equals("getUser")){
//                    String a = "2151551";
//                    result.success(a);
//                }
//            }
//        });
//    }
//    private int getBatteryLevel() {
//        int batteryLevel = -1;
//        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
//            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
//            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
//        } else {
//            Intent intent = new ContextWrapper(getApplicationContext()).
//                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
//            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
//                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
//        }
//
//        return batteryLevel;
//    }



}
