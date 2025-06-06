// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v22.4.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation

#if os(iOS) || os(tvOS)
  import Flutter
#elseif os(macOS)
  import FlutterMacOS
#else
  #error("Unsupported platform.")
#endif

/// Error class for passing custom error details to Dart side.
final class PigeonError: Error {
  let code: String
  let message: String?
  let details: Any?

  init(code: String, message: String?, details: Any?) {
    self.code = code
    self.message = message
    self.details = details
  }

  var localizedDescription: String {
    return
      "PigeonError(code: \(code), message: \(message ?? "<nil>"), details: \(details ?? "<nil>")"
  }
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let pigeonError = error as? PigeonError {
    return [
      pigeonError.code,
      pigeonError.message,
      pigeonError.details,
    ]
  }
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details,
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)",
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated class from Pigeon that represents data sent in messages.
struct SharedPreferencesPigeonOptions {
  var suiteName: String? = nil

  // swift-format-ignore: AlwaysUseLowerCamelCase
  static func fromList(_ pigeonVar_list: [Any?]) -> SharedPreferencesPigeonOptions? {
    let suiteName: String? = nilOrValue(pigeonVar_list[0])

    return SharedPreferencesPigeonOptions(
      suiteName: suiteName
    )
  }
  func toList() -> [Any?] {
    return [
      suiteName
    ]
  }
}

private class MessagesPigeonCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
    case 129:
      return SharedPreferencesPigeonOptions.fromList(self.readValue() as! [Any?])
    default:
      return super.readValue(ofType: type)
    }
  }
}

private class MessagesPigeonCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? SharedPreferencesPigeonOptions {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class MessagesPigeonCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return MessagesPigeonCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return MessagesPigeonCodecWriter(data: data)
  }
}

class MessagesPigeonCodec: FlutterStandardMessageCodec, @unchecked Sendable {
  static let shared = MessagesPigeonCodec(readerWriter: MessagesPigeonCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol LegacyUserDefaultsApi {
  func remove(key: String) throws
  func setBool(key: String, value: Bool) throws
  func setDouble(key: String, value: Double) throws
  func setValue(key: String, value: Any) throws
  func getAll(prefix: String, allowList: [String]?) throws -> [String: Any]
  func clear(prefix: String, allowList: [String]?) throws -> Bool
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class LegacyUserDefaultsApiSetup {
  static var codec: FlutterStandardMessageCodec { MessagesPigeonCodec.shared }
  /// Sets up an instance of `LegacyUserDefaultsApi` to handle messages through the `binaryMessenger`.
  static func setUp(
    binaryMessenger: FlutterBinaryMessenger, api: LegacyUserDefaultsApi?,
    messageChannelSuffix: String = ""
  ) {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    let removeChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.shared_preferences_foundation.LegacyUserDefaultsApi.remove\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      removeChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        do {
          try api.remove(key: keyArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      removeChannel.setMessageHandler(nil)
    }
    let setBoolChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.shared_preferences_foundation.LegacyUserDefaultsApi.setBool\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setBoolChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        let valueArg = args[1] as! Bool
        do {
          try api.setBool(key: keyArg, value: valueArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setBoolChannel.setMessageHandler(nil)
    }
    let setDoubleChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.shared_preferences_foundation.LegacyUserDefaultsApi.setDouble\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setDoubleChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        let valueArg = args[1] as! Double
        do {
          try api.setDouble(key: keyArg, value: valueArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setDoubleChannel.setMessageHandler(nil)
    }
    let setValueChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.shared_preferences_foundation.LegacyUserDefaultsApi.setValue\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setValueChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        let valueArg = args[1]!
        do {
          try api.setValue(key: keyArg, value: valueArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setValueChannel.setMessageHandler(nil)
    }
    let getAllChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.shared_preferences_foundation.LegacyUserDefaultsApi.getAll\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getAllChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let prefixArg = args[0] as! String
        let allowListArg: [String]? = nilOrValue(args[1])
        do {
          let result = try api.getAll(prefix: prefixArg, allowList: allowListArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getAllChannel.setMessageHandler(nil)
    }
    let clearChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.shared_preferences_foundation.LegacyUserDefaultsApi.clear\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      clearChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let prefixArg = args[0] as! String
        let allowListArg: [String]? = nilOrValue(args[1])
        do {
          let result = try api.clear(prefix: prefixArg, allowList: allowListArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      clearChannel.setMessageHandler(nil)
    }
  }
}
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol UserDefaultsApi {
  /// Adds property to shared preferences data set of type String.
  func set(key: String, value: Any, options: SharedPreferencesPigeonOptions) throws
  /// Removes all properties from shared preferences data set with matching prefix.
  func clear(allowList: [String]?, options: SharedPreferencesPigeonOptions) throws
  /// Gets all properties from shared preferences data set with matching prefix.
  func getAll(allowList: [String]?, options: SharedPreferencesPigeonOptions) throws -> [String: Any]
  /// Gets individual value stored with [key], if any.
  func getValue(key: String, options: SharedPreferencesPigeonOptions) throws -> Any?
  /// Gets all properties from shared preferences data set with matching prefix.
  func getKeys(allowList: [String]?, options: SharedPreferencesPigeonOptions) throws -> [String]
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class UserDefaultsApiSetup {
  static var codec: FlutterStandardMessageCodec { MessagesPigeonCodec.shared }
  /// Sets up an instance of `UserDefaultsApi` to handle messages through the `binaryMessenger`.
  static func setUp(
    binaryMessenger: FlutterBinaryMessenger, api: UserDefaultsApi?,
    messageChannelSuffix: String = ""
  ) {
    let channelSuffix = messageChannelSuffix.count > 0 ? ".\(messageChannelSuffix)" : ""
    /// Adds property to shared preferences data set of type String.
    let setChannel = FlutterBasicMessageChannel(
      name: "dev.flutter.pigeon.shared_preferences_foundation.UserDefaultsApi.set\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      setChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        let valueArg = args[1]!
        let optionsArg = args[2] as! SharedPreferencesPigeonOptions
        do {
          try api.set(key: keyArg, value: valueArg, options: optionsArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setChannel.setMessageHandler(nil)
    }
    /// Removes all properties from shared preferences data set with matching prefix.
    let clearChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.shared_preferences_foundation.UserDefaultsApi.clear\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      clearChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let allowListArg: [String]? = nilOrValue(args[0])
        let optionsArg = args[1] as! SharedPreferencesPigeonOptions
        do {
          try api.clear(allowList: allowListArg, options: optionsArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      clearChannel.setMessageHandler(nil)
    }
    /// Gets all properties from shared preferences data set with matching prefix.
    let getAllChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.shared_preferences_foundation.UserDefaultsApi.getAll\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getAllChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let allowListArg: [String]? = nilOrValue(args[0])
        let optionsArg = args[1] as! SharedPreferencesPigeonOptions
        do {
          let result = try api.getAll(allowList: allowListArg, options: optionsArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getAllChannel.setMessageHandler(nil)
    }
    /// Gets individual value stored with [key], if any.
    let getValueChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.shared_preferences_foundation.UserDefaultsApi.getValue\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getValueChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let keyArg = args[0] as! String
        let optionsArg = args[1] as! SharedPreferencesPigeonOptions
        do {
          let result = try api.getValue(key: keyArg, options: optionsArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getValueChannel.setMessageHandler(nil)
    }
    /// Gets all properties from shared preferences data set with matching prefix.
    let getKeysChannel = FlutterBasicMessageChannel(
      name:
        "dev.flutter.pigeon.shared_preferences_foundation.UserDefaultsApi.getKeys\(channelSuffix)",
      binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      getKeysChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let allowListArg: [String]? = nilOrValue(args[0])
        let optionsArg = args[1] as! SharedPreferencesPigeonOptions
        do {
          let result = try api.getKeys(allowList: allowListArg, options: optionsArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      getKeysChannel.setMessageHandler(nil)
    }
  }
}
