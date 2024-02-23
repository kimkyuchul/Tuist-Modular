//
//  DefaultSetting.swift
//  ProjectDescriptionHelpers
//
//  Created by Kooky macBook Air on 2/8/24.
//

import ProjectDescription

public struct DefaultSetting {
    public static let targetVersion: SettingValue = "15.0"
    public static let organizaationName = "kyuchul"
    public static let appIdentifier = "ServiceLevelProject"
    public static let baseProductSetting: SettingsDictionary = SettingsDictionary()
        .debugInformationFormat(DebugInformationFormat.dwarfWithDsym)
        .otherLinkerFlags(["$(inherited) -ObjC"])
        .bitcodeEnabled(false)
}

public extension DefaultSetting {
    static func bundleId(moduleName: String) -> String {
        return "com.\(organizaationName).\(appIdentifier).\(moduleName.lowercased())"
    }
    
    static func baseProductSetting(moduleName: String) -> SettingsDictionary {
        var settingsDictionary = SettingsDictionary()
        settingsDictionary["DEFINES_MODULE"] = "NO"
        return settingsDictionary
            .debugInformationFormat(DebugInformationFormat.dwarfWithDsym)
            .otherLinkerFlags(["$(inherited) -ObjC"])
            .otherCFlags(["-fmodule-name=\(moduleName)"])
            .bitcodeEnabled(false)
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
