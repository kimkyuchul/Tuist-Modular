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
        .Core.designSystem,
        .Core.networking,
        .data,
        .domain,
        .Feature.home,
        .Feature.event,
        .Feature.community,
        .Feature.mypage,
//        .SPM.firebase,
        .SPM.fsCalendar,
        .SPM.kingFisher,
        .SPM.lottie,
        .SPM.moya,
        .SPM.reactorKit,
        .SPM.rxDatasources,
        .SPM.rxSwift,
        .SPM.snapkit,
        .SPM.then
    ]
)
