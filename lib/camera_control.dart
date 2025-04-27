
import 'camera_control_platform_interface.dart';

class CameraControl {
  Future<String?> getPlatformVersion() {
    return CameraControlPlatform.instance.getPlatformVersion();
  }
}
