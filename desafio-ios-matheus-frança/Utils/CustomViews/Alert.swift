//
//  Alert.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 23/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func errorAlert(message: String? = "Error retrieving the infomration, try again later", tryAgainMethod: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.cancel, handler: { _ in
            tryAgainMethod?()
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
}
