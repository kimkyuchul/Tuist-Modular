//
//  DefaultSetting.swift
//  ProjectDescriptionHelpers
//
//  Created by Kooky macBook Air on 2/8/24.
//

import ProjectDescription

public struct DefaultSetting {
    public static let targetVersion: SettingValue = "15.0"
//    public static let appVersion: SettingValue = "4.2.1"
//    public static let buildNumber: SettingValue = "1"
    public static let organizaationName = "kyuchul"
    public static let appIdentifier = "serviceLevelProject"
    
    public static let baseProductSetting: SettingsDictionary = [
        "IPHONEOS_DEPLOYMENT_TARGET": targetVersion
    ]
}

public extension DefaultSetting {
    static func bundleId(moduleName: String) -> String {
        return "com.\(organizaationName).\(appIdentifier).\(moduleName.lowercased())"
    }
}

public extension SettingValue {
    var stringValue: String {
        switch self {
        case .string(let string):
            return string
            
        case .array(let array):
            guard let value = array.first else { return "" }
            return value
            
        @unknown default:
            return ""
        }
    }
}
