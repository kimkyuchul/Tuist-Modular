//
//  SceneDelegate.swift
//  ServiceLevelProject
//
//  Created by Kooky macBook Air on 2/12/24.
//  Copyright © 2024 kyuchul. All rights reserved.
//

import UIKit

import Features

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
#if debug
        let vc = UIViewController()
        vc.view.backgroundColor = .systemPink
#endif
        window?.rootViewController = HomeViewController()
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
