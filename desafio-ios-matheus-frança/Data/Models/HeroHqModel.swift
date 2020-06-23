//
//  HeroHqModel.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 23/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation

class HeroHqModel: Codable {
    var image: String
    var title: String
    var id: String
    var description: String
    var price: String
    
    init(image: String, title: String, id: String, description: String = descriptionMock, price: String ) {
        self.image = image
        self.title = title
        self.id = id
        self.description = description
        self.price = price
    }
}
