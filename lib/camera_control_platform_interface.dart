import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'camera_control_method_channel.dart';

abstract class CameraControlPlatform extends PlatformInterface {
  /// Constructs a CameraControlPlatform.
  CameraControlPlatform() : super(token: _token);

  static final Object _token = Object();

  static CameraControlPlatform _instance = MethodChannelCameraControl();

  /// The default instance of [CameraControlPlatform] to use.
  ///
  /// Defaults to [MethodChannelCameraControl].
  static CameraControlPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CameraControlPlatform] when
  /// they register themselves.
  static set instance(CameraControlPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
