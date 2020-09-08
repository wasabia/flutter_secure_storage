import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import './method_channel_flutter_secure_stoage.dart';


abstract class FlutterSecureStoragePlatformInterface extends PlatformInterface {
  /// Constructs a UrlLauncherPlatform.
  FlutterSecureStoragePlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static FlutterSecureStoragePlatformInterface _instance = MethodChannelFlutterSecureStorage();

  static FlutterSecureStoragePlatformInterface get instance => _instance;

  static set instance(FlutterSecureStoragePlatformInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // =============================================
  Future<String> read({String key}) {
    throw UnimplementedError('read() has not been implemented.');
  }

  Future<void> write({String key, String value}) {
    throw UnimplementedError('write() has not been implemented.');
  }

  Future<void> delete({String key}) {
    throw UnimplementedError('delete() has not been implemented.');
  }
  
}