//
//  HeroesResponseModel.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 25/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation

class HeroDataResponseModel: Codable {
    var data: HeroListResponseModel?
}

class HeroListResponseModel: Codable {
    var results: [HeroResponseModel]?
    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    
    init(results: [HeroResponseModel], offset: Int?, limit: Int?, total: Int?, count: Int?) {
        self.results = results
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
    }
}

class HeroResponseModel: Codable {
    var thumbnail: HeroThumbnailResponseModel?
    var name: String?
    var id: Int?
    var description: String?
    
    init(thumbnail: HeroThumbnailResponseModel?, name: String?, id: Int?, description: String?) {
        self.thumbnail = thumbnail
        self.name = name
        self.id = id
        self.description = description
    }
}

class HeroThumbnailResponseModel: Codable {
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
