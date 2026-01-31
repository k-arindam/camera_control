//
//  CCAttach.swift
//  camera_control
//
//  Created by Arindam Karmakar on 27/04/25.
//

import Foundation
import UIKit

internal protocol CCAttach {
    func attach() throws(CCError) -> Void
    
    var root: UIWindow? { get }
}
