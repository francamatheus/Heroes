//
//  AppCoordinator.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 22/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {
    class func startViewController (newVC: UIViewController, parent: Any) {
        if let window = parent as? UIWindow {
            window.rootViewController = newVC
        } else if let nav = parent as? UINavigationController {
            nav.pushViewController(newVC, animated: true)
        } else if let controller = parent as? UIViewController {
            controller.present(newVC, animated: true, completion: nil)
        }
    }
    
    class func goToHeroes(parent: Any) {
        let startVc = HeroesViewController()
        let navController = UINavigationController(rootViewController: startVc)
        AppCoordinator.startViewController(newVC: navController, parent: parent)
    }
    
    class func goToHeroDetail(parent: Any, heroModel: HeroModel) {
        let vc = HeroDetailViewController(heroModel: heroModel)
        AppCoordinator.startViewController(newVC: vc, parent: parent)
    }
    
    class func goToHeroHq(parent: Any, heroId: Int) {
        let vc = HeroHqViewController(heroId: heroId)
        AppCoordinator.startViewController(newVC: vc, parent: parent)
    }
}
