//
//  SceneDelegate.swift
//  github trends
//
//  Created by admin on 05.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = createNC()
        window?.makeKeyAndVisible()
    }
    
    func createNC() -> UINavigationController {
        let navigationController = UINavigationController()
        let chartsVC = RepoChartsViewController()
        chartsVC.title = "Kotlin charts"
        navigationController.pushViewController(chartsVC, animated: true)
        return navigationController
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

