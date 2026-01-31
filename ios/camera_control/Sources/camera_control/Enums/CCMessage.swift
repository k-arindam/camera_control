//
//  File.swift
//  camera_control
//
//  Created by Arindam Karmakar on 27/04/25.
//

import Foundation

internal enum CCMessage: String, Codable, CaseIterable {
    case unableToAttach = "Unable to attach CCService to the camera session"
    case attachSuccess = "CCService attached successfully to the camera session"
    
    var type: Utils.LogType {
        switch self {
        case .unableToAttach:
                .error
        case .attachSuccess:
                .success
        }
    }
}
