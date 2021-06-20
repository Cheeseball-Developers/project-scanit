// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'models/settings/permissions_model.dart' as _i4;
import 'services/permission_handler/permission_handler_service.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.PermissionHandlerService>(_i3.PermissionHandlerService());
  gh.singleton<_i4.PermissionsModel>(
      _i4.PermissionsModel(get<_i3.PermissionHandlerService>()));
  return get;
}
