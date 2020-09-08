import 'dart:async';
import 'dart:html' as html;

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_secure_storage_platform_interface/flutter_secure_storage_platform_interface.dart';


class FlutterSecureStoragePlugin extends FlutterSecureStoragePlatformInterface {
  final html.Storage _localStorage = html.window.localStorage;

  static void registerWith(Registrar registrar) {
    // final MethodChannel channel = MethodChannel(
    //     'plugins.it_nomads.com/flutter_secure_storage',
    //     const StandardMethodCodec(),
    //     registrar.messenger);
    // final FlutterSecureStoragePlugin instance = FlutterSecureStoragePlugin();
    // channel.setMethodCallHandler(instance.handleMethodCall);

    FlutterSecureStoragePlatformInterface.instance = FlutterSecureStoragePlugin();

  }

  @override
  Future<String> read({String key}) {
    return Future<String>.value(_localStorage[key]);
  }

  @override
  Future<void> write({String key, String value}) {
    _localStorage[key] = value;
    return Future<void>.value();
  }

  @override
  Future<void> delete({String key}) {
    _localStorage.remove(key);

    return Future<void>.value();
  }


  // Future<dynamic> handleMethodCall(MethodCall call) async {
  //   switch (call.method) {
  //     case 'write':
  //       var _args = call.arguments;
  //       var _key = _args["key"];
  //       var _value = _args["value"];
      
  //       _localStorage[_key] = _value;
  //       return true;
  //     case 'read':
  //       var _args = call.arguments;
  //       var _key = _args["key"];
  //       return _localStorage[_key];
  //     case 'delete':
  //       var _args = call.arguments;
  //       var _key = _args["key"];
  //       return _localStorage.remove(_key);
  //     default:
  //       throw PlatformException(
  //           code: 'Unimplemented',
  //           details: "The url_launcher plugin for web doesn't implement "
  //               "the method '${call.method}'");
  //   }
  // }
}