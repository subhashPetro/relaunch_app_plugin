import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'relaunch_app_platform_interface.dart';

/// An implementation of [RelaunchAppPlatform] that uses method channels.
class MethodChannelRelaunchApp extends RelaunchAppPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('relaunch_app');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
