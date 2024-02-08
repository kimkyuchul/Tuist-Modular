//
//  TargetDependency+Templates.swift
//  ProjectDescriptionHelpers
//
//  Created by Kooky macBook Air on 2/8/24.
//

import ProjectDescription

public extension TargetDependency {
    class Core {
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
    
    class Feature {
        public static let home = TargetDependency.project(
            target: "Home",
            path: .relativeToRoot("./Modules/Feature/Home")
        )
        
        public static let event = TargetDependency.project(
            target: "Event",
            path: .relativeToRoot("./Modules/Feature/Event")
        )
        
        public static let community = TargetDependency.project(
            target: "Community",
            path: .relativeToRoot("./Modules/Feature/Community")
        )
        
        public static let mypage = TargetDependency.project(
            target: "MyPage",
            path: .relativeToRoot("./Modules/Feature/MyPage")
        )
    }
    
    class SPM {
        public static let reactorKit = TargetDependency.external(name: "ReactorKit")
        public static let rxSwift = TargetDependency.external(name: "RxSwift")
        public static let moya = TargetDependency.external(name: "Moya")
        public static let snapkit = TargetDependency.external(name: "SnapKit")
        public static let then = TargetDependency.external(name: "Then")
        public static let firebase = TargetDependency.external(name: "Firebase")
        public static let rxDatasources = TargetDependency.external(name: "RxDataSources")
        public static let kingFisher = TargetDependency.external(name: "Kingfisher")
        public static let fsCalendar = TargetDependency.external(name: "FSCalendar")
        public static let lottie = TargetDependency.external(name: "Lottie")
    }
}
