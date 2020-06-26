//
//  HeroHqResponseModel.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 26/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation

class HeroHqDataResponseModel: Codable {
    var data: HeroHqListResponseModel?
    var message: String?
}

class HeroHqListResponseModel: Codable {
    var results: [HeroHqResponseModel]?
    var offset: Int?
    var limit: Int?
    
    init(results: [HeroHqResponseModel], offset: Int?, limit: Int?) {
        self.results = results
        self.offset = offset
        self.limit = limit
    }
}

class HeroHqResponseModel: Codable {
    var thumbnail: HeroHqThumbnailResponseModel?
    var title: String?
    var id: Int?
    var description: String?
    var prices: [HeroHqPriceResponseModel]?
    
    init(thumbnail: HeroHqThumbnailResponseModel?, title: String?, id: Int?, description: String?, prices: [HeroHqPriceResponseModel]?) {
        self.thumbnail = thumbnail
        self.title = title
        self.id = id
        self.description = description
        self.prices = prices
    }
}

class HeroHqPriceListResponseModel: Codable {
    var prices: [HeroHqPriceResponseModel]?
    
    init(prices: [HeroHqPriceResponseModel]?) {
        self.prices = prices
    }
}

class HeroHqPriceResponseModel: Codable {
    var type: String?
    var price: Double?
    
    init(price: Double?, type: String?) {
        self.type = type
        self.price = price
    }
}

class HeroHqThumbnailResponseModel: Codable {
    var path: String?
    var imageExtension: String?
    
    init(path: String?, imageExtension: String?) {
        self.path = path
        self.imageExtension = imageExtension
    }
    
    private enum CodingKeys: String, CodingKey {
        case path, imageExtension = "extension"
    }
}
