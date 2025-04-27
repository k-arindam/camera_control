import 'package:flutter_test/flutter_test.dart';
import 'package:camera_control/camera_control.dart';
import 'package:camera_control/camera_control_platform_interface.dart';
import 'package:camera_control/camera_control_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCameraControlPlatform
    with MockPlatformInterfaceMixin
    implements CameraControlPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CameraControlPlatform initialPlatform = CameraControlPlatform.instance;

  test('$MethodChannelCameraControl is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCameraControl>());
  });

  test('getPlatformVersion', () async {
    CameraControl cameraControlPlugin = CameraControl();
    MockCameraControlPlatform fakePlatform = MockCameraControlPlatform();
    CameraControlPlatform.instance = fakePlatform;

    expect(await cameraControlPlugin.getPlatformVersion(), '42');
  });
}
