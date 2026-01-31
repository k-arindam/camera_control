import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'camera_control_platform_interface.dart';
import 'enums/ccmethod.dart';

/// An implementation of [CameraControlPlatform] that uses method channels.
class MethodChannelCameraControl extends CameraControlPlatform {
  /// The method channel used to interact with the native platform.
  final _methodChannel = const MethodChannel('camera_control');

  Future<T?> _invoke<T>({
    required CCMethod method,
    Map<String, dynamic>? args,
  }) async => await _methodChannel.invokeMethod<T>(method.rawValue, args);

  @override
  Future<String?> getPlatformVersion() async {
    final version = await _invoke<String>(method: CCMethod.platformVersion);
    return version;
  }

  @override
  Future<void> attach() async {
    final resp = await _invoke<String>(method: CCMethod.attach);
    debugPrint(resp);
  }
}
