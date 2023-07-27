import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:relaunch_app/relaunch_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    print("init.....000");
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> relaunchApp() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      bool value = await RelaunchApp.reLaunchApp();
      print("relaunched - $value");
    } on PlatformException {
      log("Relaunch Exception ");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(
              onPressed: () {
                relaunchApp();
              },
              child: Text('Running on: $_platformVersion\n')),
        ),
      ),
    );
  }
}
