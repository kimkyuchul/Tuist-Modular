//
//  Project.swift
//  ServiceLevelProjectManifests
//
//  Created by Kooky macBook Air on 2/8/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let name = "DesignSystem"

let project = Project.makeModule(
    name: name,
    product: .staticLibrary,
    includeResource: true,
    dependencies: [
        .SPM.lottie
    ]
)

