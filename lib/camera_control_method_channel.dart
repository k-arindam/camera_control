import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'camera_control_platform_interface.dart';

/// An implementation of [CameraControlPlatform] that uses method channels.
class MethodChannelCameraControl extends CameraControlPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('camera_control');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
