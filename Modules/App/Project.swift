//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 김규철 on 2024/01/09.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "App",
    product: .app,
    includeResource: true,
    dependencies: [
        .Feature.home,
        .Feature.event,
        .Feature.community,
        .Feature.mypage
    ]
)
