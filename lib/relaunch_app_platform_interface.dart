import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'relaunch_app_method_channel.dart';

abstract class RelaunchAppPlatform extends PlatformInterface {
  /// Constructs a RelaunchAppPlatform.
  RelaunchAppPlatform() : super(token: _token);

  static final Object _token = Object();

  static RelaunchAppPlatform _instance = MethodChannelRelaunchApp();

  /// The default instance of [RelaunchAppPlatform] to use.
  ///
  /// Defaults to [MethodChannelRelaunchApp].
  static RelaunchAppPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RelaunchAppPlatform] when
  /// they register themselves.
  static set instance(RelaunchAppPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
