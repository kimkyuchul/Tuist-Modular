//
//  Dependencies.swift
//  Config
//
//  Created by Kooky macBook Air on 1/7/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: [
        .github(path: "realm/realm-swift", requirement: .upToNext("10.46.0"))
    ],
    swiftPackageManager: SwiftPackageManagerDependencies([
        .reactorKit,
        .rxSwift,
        .moya,
        .snapkit,
        .then,
        .rxDatasources,
        .kingFisher,
        .fsCalendar,
        .lottie,
        .firebase
    ],
                                                         productTypes: [
                                                            "Lottie" : .framework
                                                         ],
                                                         baseSettings: .settings(configurations: [
                                                            .debug(name: .debug),
                                                            .release(name: .release)
                                                         ]
                                                         )
    ),
    platforms: [.iOS]
)
