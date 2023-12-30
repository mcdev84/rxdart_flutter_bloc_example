import 'package:device_info_plus/device_info_plus.dart';

abstract class DeviceInfosRepository {
  Future<AndroidDeviceInfo> getAndroidInfos();

  Future<dynamic> setAndroidInfos();
}

class DeviceInfosRepositoryImpl implements DeviceInfosRepository {
  final DeviceInfoPlugin deviceInfoPlugin;

  DeviceInfosRepositoryImpl() : deviceInfoPlugin = DeviceInfoPlugin();

  @override
  Future<AndroidDeviceInfo> getAndroidInfos() async =>
      await deviceInfoPlugin.androidInfo
          .then((value) => value)
          .catchError((onError) => throw onError);

  @override
  Future setAndroidInfos() async {
    return await deviceInfoPlugin.androidInfo
        .then((value) => value)
        .catchError((onError) => throw onError);
  }
}
