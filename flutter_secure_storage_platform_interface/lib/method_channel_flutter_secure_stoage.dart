import 'dart:async';

import 'package:flutter/services.dart';

import './flutter_secure_storage_platform_interface.dart';

const MethodChannel _channel = MethodChannel('plugins.it_nomads.com/flutter_secure_storage');


class MethodChannelFlutterSecureStorage extends FlutterSecureStoragePlatformInterface {
  @override
  Future<String> read({String key}) {
    return _channel.invokeMethod<String>(
      'read',
      <String, Object>{
        'key': key,
      },
    );
  }

  @override
  Future<void> write({String key, String value}) {
    return _channel.invokeMethod<String>(
      'write',
      <String, Object>{
        'key': key,
        'value': value
      },
    );
  }

  @override
  Future<void> delete({String key}) {
    return _channel.invokeMethod<String>(
      'delete',
      <String, Object>{
        'key': key
      },
    );
  }

}