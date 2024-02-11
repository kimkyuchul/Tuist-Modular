//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Kooky macBook Air on 2/8/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let name = "Event"

let project = Project.makeFeatureModule(
    name: name,
    dependencies: [
        .domain
    ],
    includeDemo: true
)
