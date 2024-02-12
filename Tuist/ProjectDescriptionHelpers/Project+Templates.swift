import ProjectDescription

public enum MicroFeatureTarget {
    case unitTest
    case demo
}

extension Project {
    public static func makeModule(
        name: String,
        product: Product,
        targets: Set<MicroFeatureTarget>,
        package: [Package] = [],
        infoPlist: InfoPlist = .default,
        includeSource: Bool = true,
        includeResource: Bool = false,
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
        
        var allTargets: [Target] = [
            Target(
                name: name,
                platform: .iOS,
                product: product,
                bundleId: DefaultSetting.bundleId(moduleName: name),
                deploymentTarget: .iOS(
                    targetVersion: DefaultSetting.targetVersion.stringValue,
                    devices: .iphone
                ),
                infoPlist: infoPlist,
                sources: includeSource ? .default : nil,
                resources: includeResource ? .default : nil,
                dependencies: dependencies
            )
        ]
        
        if targets.contains(.unitTest) {
            let testTarget = Target(
                name: "\(name)Tests",
                platform: .iOS,
                product: .unitTests,
                bundleId: "\(DefaultSetting.bundleId(moduleName: name.lowercased())).\(name)Tests",
                infoPlist: .default,
                sources: ["Tests/Sources/**"],
                resources: includeResource ? [.glob(pattern: "Tests/Resources/**", excluding: [])] : nil,
                dependencies: [
                    .target(name: name)
                ]
            )
            
            allTargets.append(testTarget)
        }
        
        if targets.contains(.demo) {
            let demoTarget = Target(
                name: "\(name)Demo",
                platform: .iOS,
                product: .app,
                bundleId: "\(DefaultSetting.bundleId(moduleName: name.lowercased())).\(name)Demo",
                infoPlist: .default,
                sources: ["Demo/Sources/**"],
                dependencies: [
                    .target(name: name)
                ]
            )
            
            allTargets.append(demoTarget)
        }
        
        let schemes: [Scheme] = targets.contains(.demo) ?
        [.makeScheme(target: .debug, name: name), .makeDemoScheme(target: .debug, name: name)] :
        [.makeScheme(target: .debug, name: name)]
        
        return Project(
            name: name,
            organizationName: DefaultSetting.organizaationName,
            packages: package,
            settings: settings,
            targets: allTargets,
            schemes: schemes
        )
    }
}
