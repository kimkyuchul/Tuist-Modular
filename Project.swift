import ProjectDescription
import ProjectDescriptionHelpers
import UtilPlugin

/*
                +-------------+
                |             |
                |     App     | Contains ServiceLevelProject App target and ServiceLevelProject unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project.app(name: "ServiceLevelProject",
                          destinations: .iOS,
                          additionalTargets: ["ServiceLevelProjectKit", "ServiceLevelProjectUI"])
