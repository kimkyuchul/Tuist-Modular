import ProjectDescription

extension Project {
    public static func makeModule(
        name: String,
        product: Product,
        package: [Package] = [],
        includeSource: Bool = true,
        includeResource: Bool = false,
        dependencies: [ProjectDescription.TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            organizationName: DefaultSetting.organizaationName,
            packages: package,
            settings: .settings(
                base: DefaultSetting.baseProductSetting,
                configurations: [
                    .debug(name: .debug),
                    .release(name: .release)
                ]
            ),
            targets: [
                Target(
                    name: name,
                    platform: .iOS,
                    product: product,
                    bundleId: DefaultSetting.bundleId(moduleName: name),
                    deploymentTarget: .iOS(
                        targetVersion: DefaultSetting.targetVersion.stringValue,
                        devices: .iphone
                    ),
                    sources: includeSource ? .default : nil,
                    resources: includeResource ? .default : nil,
                    dependencies: dependencies
                )
            ],
            schemes: [
                Scheme(
                    name: name,
                    buildAction: BuildAction(targets: [.project(path: ".", target: name)])
                )
            ]
        )
    }
    
    public static func makeFeatureModule(
        name: String,
        package: [Package] = [],
        dependencies: [TargetDependency],
        includeDemo: Bool
    ) -> Project {
        var targets: [Target] = []
        var schemes: [Scheme] = []
        
        let mainTarget = Target(
            name: name,
            platform: .iOS,
            product: .framework,
            bundleId: DefaultSetting.bundleId(moduleName: name),
            infoPlist: "Targets/\(name)/Info.plist",
            sources: ["Targets/\(name)/Sources/**"],
            resources: ["Targets/\(name)/Resources/**"],
            dependencies: dependencies
        )
        targets.append(mainTarget)
        
        let mainScheme = Scheme(
            name: name,
            buildAction: BuildAction(targets: ["\(name)"])
        )
        schemes.append(mainScheme)
        
        if includeDemo {
            let demoTarget = Target(
                name: "\(name)Demo",
                platform: .iOS,
                product: .app,
                bundleId: DefaultSetting.bundleId(moduleName: name.lowercased()) + "-demo",
                infoPlist: "Targets/Demo/Info.plist",
                sources: ["Targets/Demo/Sources/**"],
                dependencies: [
                    .project(target: "\(name)", path: "./"),
//                    .mock,
//                    .SPM.snapKit
                ]
            )
            
            targets.append(demoTarget)
            
            let demoScheme = Scheme(
                name: name + "Demo",
                buildAction: BuildAction(targets: ["\(name)Demo", "\(name)"]),
                runAction: .runAction(
                    configuration: .debug,
                    attachDebugger: true
                )
            )
            schemes.append(demoScheme)
        }
        
        return Project(
            name: name,
            organizationName: DefaultSetting.organizaationName,
            packages: package,
            settings: .settings(
                base: DefaultSetting.baseProductSetting,
                configurations: [
                    .debug(name: .debug),
                    .release(name: .release)
                ]
            ),
            targets: targets,
            schemes: schemes
        )
    }
}


