// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'models/scan/image_processing_model.dart' as _i4;
import 'models/settings/permissions_model.dart' as _i6;
import 'services/opencv/opencv_service.dart' as _i3;
import 'services/permission_handler/permission_handler_service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.OpenCVService>(() => _i3.OpenCVService());
  gh.lazySingleton<_i4.ImageProcessingModel>(
      () => _i4.ImageProcessingModel(get<_i3.OpenCVService>()));
  gh.singleton<_i5.PermissionHandlerService>(_i5.PermissionHandlerService());
  gh.singleton<_i6.PermissionsModel>(
      _i6.PermissionsModel(get<_i5.PermissionHandlerService>()));
  return get;
}
