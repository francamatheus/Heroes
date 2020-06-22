//
//  AppDelegate.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 19/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        setRoot()
        window!.makeKeyAndVisible()
        return true
    }
    
    func setRoot() {
        guard let window = UIApplication.shared.windows.first else { return }
        AppCoordinator.goToHeroes(parent: window)
    }
}

