//
//  Dependencies.swift
//  Config
//
//  Created by Kooky macBook Air on 1/7/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
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
                                                         baseSettings: .settings(configurations: [
                                                            .debug(name: .debug),
                                                            .release(name: .release)
                                                         ]
                                                         )
    ),
    platforms: [.iOS]
)
