//
//  Project+App.swift
//  ProjectDescriptionHelpers
//
//  Created by Kooky macBook Air on 2/12/24.
//

import ProjectDescription

extension Project {
    public static func app(
        name: String,
        product: Product = .app,
        package: [Package] = [],
        dependencies: [ProjectDescription.TargetDependency]
    ) -> Project {
        let settings: Settings = .settings(
            base: DefaultSetting.baseProductSetting,
            configurations: [
              .debug(name: .debug),
              .release(name: .release)
            ],
            defaultSettings: .recommended
          )
        
        let mainTarget = Target(
            name: name,
            platform: .iOS,
            product: product,
            bundleId: DefaultSetting.bundleId(moduleName: name),
            deploymentTarget: .iOS(
                targetVersion: DefaultSetting.targetVersion.stringValue,
                devices: .iphone
            ),
            infoPlist: .file(path: "Support/Info.plist"),
            sources: .default,
            resources: .default,
            dependencies: dependencies
        )
        
        let testTarget = Target(
            name: "\(name)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "\(DefaultSetting.bundleId(moduleName: name.lowercased())).\(name)Tests",
            infoPlist: .default,
            sources: ["Tests/Sources/**"],
            resources: [.glob(pattern: "Tests/Resources/**", excluding: [])],
            dependencies: [
                .target(name: name)
            ]
        )
        
        return Project(name: name,
                       organizationName: DefaultSetting.organizaationName,
                       settings: settings,
                       targets: [mainTarget, testTarget],
                       schemes: Project.appScheme)
    }
}
