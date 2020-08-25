import Cocoa
import FlutterMacOS

import KeychainSwift

public class FlutterSecureStoragePlugin: NSObject, FlutterPlugin {

  var keychain: KeychainSwift = KeychainSwift();

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugins.it_nomads.com/flutter_secure_storage", binaryMessenger: registrar.messenger)
    let instance = FlutterSecureStoragePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    let methodName = call.method as! String;
    
    guard let args : [String: Any] = call.arguments as! [String : Any] else {
      result(" arguments error.... ")
    }

    let options = args["options"] as? [String : Any];

    switch methodName {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "read":
      let key = args["key"] as! String;
      let groupId = options?["groupId"] as? String;
      let kValue = keychain.get(key);
      result(kValue);
    case "write":
      let key = args["key"] as! String;
      let groupId = options?["groupId"] as? String;
      let value = args["value"] as! String;
      keychain.set(value, forKey: key);
      result(nil);
    case "delete":
      let key = args["key"] as! String;
      let groupId = options?["groupId"] as? String;
      
      keychain.delete(key);
      result(nil);
    case "deleteAll":
      let keys = keychain.allKeys;
      result(nil);
    case "readAll":
      result(nil);
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
