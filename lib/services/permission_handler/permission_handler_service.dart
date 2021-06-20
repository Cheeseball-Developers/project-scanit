import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@Singleton()
class PermissionHandlerService {
  Future<Map<Permission, PermissionStatus>> getAllPermissions() async {
    return [Permission.camera, Permission.storage].request();
  }

  Future<PermissionStatus> getCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isDenied) {
      status = await Permission.camera.request();
    }
    return status;
  }

  Future<PermissionStatus> getStoragePermission() async {
    PermissionStatus status = await Permission.storage.status;
    if (status.isDenied) {
      status = await Permission.storage.request();
    }
    return status;
  }
}
