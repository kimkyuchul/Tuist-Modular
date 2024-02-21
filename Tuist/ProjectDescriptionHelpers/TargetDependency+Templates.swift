//
//  TargetDependency+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by Kooky macBook Air on 2/8/24.
//

import ProjectDescription

public extension TargetDependency {

    static let core = TargetDependency.project(
        target: "Core",
        path: .relativeToRoot("./Modules/Core")
    )
    
    class Core {
        public static let thirdPartyLib = TargetDependency.project(
            target: "ThirdPartyLib",
            path: .relativeToRoot("./Modules/Core/ThirdPartyLib")
        )
        
        public static let util = TargetDependency.project(
            target: "Util",
            path: .relativeToRoot("./Modules/Core/Util")
        )
        
        public static let networking = TargetDependency.project(
            target: "Networking",
            path: .relativeToRoot("./Modules/Core/Network")
        )
        
        public static let designSystem = TargetDependency.project(
            target: "DesignSystem",
            path: .relativeToRoot("./Modules/Core/DesignSystem")
        )
    }
    
    static let data = TargetDependency.project(
        target: "Data",
        path: .relativeToRoot("./Modules/Data")
    )
    
    static let domain = TargetDependency.project(
        target: "Domain",
        path: .relativeToRoot("./Modules/Domain")
    )
    
    static let commonFeature = TargetDependency.project(
        target: "CommonFeature",
        path: .relativeToRoot("./Modules/CommonFeature")
    )
    
    class Feature {
        public static let features = TargetDependency.project(
            target: "Features",
            path: .relativeToRoot("./Modules/Features")
        )
    }
    
    class SPM {
        public static let reactorKit = TargetDependency.external(name: "ReactorKit")
        public static let rxSwift = TargetDependency.external(name: "RxSwift")
        public static let moya = TargetDependency.external(name: "Moya")
        public static let snapkit = TargetDependency.external(name: "SnapKit")
        public static let then = TargetDependency.external(name: "Then")
        public static let firebaseMessaging = TargetDependency.external(name: "FirebaseMessaging")
        public static let firebaseAnalytics = TargetDependency.external(name: "FirebaseAnalytics")
        public static let rxDatasources = TargetDependency.external(name: "RxDataSources")
        public static let kingFisher = TargetDependency.external(name: "Kingfisher")
        public static let fsCalendar = TargetDependency.external(name: "FSCalendar")
        public static let lottie = TargetDependency.external(name: "Lottie")
    }
    
    class Carthage {
        public static let realm = TargetDependency.external(name: "Realm")
        public static let realmSwift = TargetDependency.external(name: "RealmSwift")
    }
}
