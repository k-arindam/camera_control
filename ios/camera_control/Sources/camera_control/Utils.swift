//
//  Utils.swift
//  camera_control
//
//  Created by Arindam Karmakar on 27/04/25.
//

import AVFoundation
import UIKit

internal final class Utils {
    private init() {}
    
    static func findAVCaptureSession(in view: UIView) -> AVCaptureSession? {
        if let previewLayer = view.layer.sublayers?.compactMap({ $0 as? AVCaptureVideoPreviewLayer }).first,
           let session = previewLayer.session{
            return session
        }
        
        for subView in view.subviews {
            if let session = findAVCaptureSession(in: subView) {
                return session
            }
        }
        
        return nil
    }
    
    static func log(_ msg: String, type: LogType) -> Void {
        debugPrint("----->>> \(type.rawValue) CameraControl: \(msg)")
    }
    
    static func log(_ msg: CCMessage) -> Void { Self.log(msg.rawValue, type: msg.type) }
    
    enum LogType: String, CaseIterable {
        case success = "🟢"
        case error = "🔴"
        case warning = "⚠️"
    }
}
