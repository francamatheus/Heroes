//
//  HeroesModel.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 22/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation

class HeroModel: Codable {
    var image: String
    var name: String
    var id: String
    
    init(image: String, name: String, id: String) {
        self.image = image
        self.name = name
        self.id = id
    }
}
