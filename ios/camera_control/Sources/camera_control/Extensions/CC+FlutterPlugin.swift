//
//  CC+FlutterPlugin.swift
//  camera_control
//
//  Created by Arindam Karmakar on 27/04/25.
//

import Foundation
import Flutter

extension CameraControlPlugin: FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "camera_control", binaryMessenger: registrar.messenger())
        let instance = CameraControlPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let method = CCMethod.allCases.first(where: { $0.rawValue == call.method })
        else { result(FlutterMethodNotImplemented); return }
        
        do {
            switch method {
            case .platformVersion:
                result("iOS " + UIDevice.current.systemVersion)
            case .attach:
                try self.attach()
                result("true")
            }
        } catch {
            result(error.localizedDescription)
        }
    }
}
