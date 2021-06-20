import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:project_scanit/services/permission_handler/permission_handler_service.dart';
import 'package:permission_handler/permission_handler.dart';

@Singleton()
class PermissionsModel extends ChangeNotifier {
  final PermissionHandlerService _service;

  Option<PermissionStatus> cameraPermissionStatusOption = none();
  Option<PermissionStatus> storagePermissionStatusOption = none();

  PermissionsModel(this._service) {
    print('yep');
    _service.getCameraPermission();
  }

  void doNothing() {
    print('called');
  }
}