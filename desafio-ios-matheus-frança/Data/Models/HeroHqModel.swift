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
    var id: Int
    var description: String
    var price: Double
    
    init(image: String?, title: String?, id: Int?, description: String?, price: Double?) {
        self.image = image ?? ""
        self.title = title ?? ""
        self.id = id ?? 0
        self.description = description ?? ""
        self.price = price ?? 0.0
    }
    
    static func mapFrom(response: [HeroHqResponseModel]?) -> [HeroHqModel] {
        var heroModel: [HeroHqModel] = []
        response?.forEach { (item) in
            heroModel.append(HeroHqModel(
                image: getImage(item: item),
                title: item.title ?? "",
                id: item.id ?? 0,
                description: item.description ?? "",
                price: getPrice(item: item) ?? 0.0) 
            )
        }
        return heroModel
    }
    
    static private func getImage(item: HeroHqResponseModel) -> String {
         let httpImage = "\(item.thumbnail?.path ?? "").\(item.thumbnail?.imageExtension ?? "")"
         let httpsImage = "https" + httpImage.dropFirst(4)
        return httpsImage
    }
    
    static private func getPrice(item: HeroHqResponseModel) -> Double? {
        var physicalPrice: Double?
        item.prices?.forEach({ (price) in
            if price.type == "printPrice" {
                physicalPrice = price.price
            }
        })
        return physicalPrice
    }
}
