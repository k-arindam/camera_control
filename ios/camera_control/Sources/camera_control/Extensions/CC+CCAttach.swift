//
//  CC+CCAttach.swift
//  camera_control
//
//  Created by Arindam Karmakar on 27/04/25.
//

import Foundation
import UIKit

extension CameraControlPlugin: CCAttach {
    func attach() throws(CCError) -> Void {
        guard let root,
              let session = Utils.findAVCaptureSession(in: root)
        else {
            Utils.log(.unableToAttach)
            throw .unableToAttach
        }
        
        self.cameraSession = session
        Utils.log(.attachSuccess)
    }
    
    var root: UIWindow? {
        UIApplication
            .shared
            .connectedScenes
            .compactMap { scene in
                (scene as? UIWindowScene)?.keyWindow
            }
            .first
    }
}
