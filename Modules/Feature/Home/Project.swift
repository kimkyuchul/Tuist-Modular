//
//  Project.swift
//  ServiceLevelProjectManifests
//
//  Created by Kooky macBook Air on 2/8/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let name = "Home"

let project = Project.makeFeatureModule(
    name: name,
    dependencies: [],
    includeDemo: true
)
