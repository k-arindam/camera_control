//
//  CCMethod.swift
//  camera_control
//
//  Created by Arindam Karmakar on 27/04/25.
//

import Foundation

internal enum CCMethod: String, Codable, CaseIterable {
    case platformVersion = "CCPlatformVersion"
    case attach = "CCAttach"
}
