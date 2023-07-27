import 'dart:async';

import 'package:flutter/services.dart';

class RelaunchApp {
  static const MethodChannel _channel = MethodChannel('relaunch_app');

  /// Restarts the app
  static Future<bool> reLaunchApp() async {
    return await _channel.invokeMethod('relaunchApp');
  }
}