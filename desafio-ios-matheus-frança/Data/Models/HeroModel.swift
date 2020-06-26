//
//  HeroModel.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 22/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation

class HeroModel {
    var image: String?
    var name: String?
    var id: Int?
    var description: String?
    
    init(image: String?, name: String?, id: Int?, description: String?) {
        self.image = image ?? ""
        self.name = name ?? ""
        self.id = id ?? 0
        self.description = description ?? ""
    }
    
    // MARK: - Mapping
    static func mapFrom(response: [HeroResponseModel]?) -> [HeroModel] {
        var heroModel: [HeroModel] = []
        response?.forEach { (item) in
            let httpImage = "\(item.thumbnail?.path ?? "").\(item.thumbnail?.imageExtension ?? "")"
            let httpsImage = "https" + httpImage.dropFirst(4)
            heroModel.append(HeroModel(
                image: httpsImage,
                name: item.name ?? "",
                id: item.id ?? 0,
                description: item.description ?? "")
            )
        }
        return heroModel
    }
}
