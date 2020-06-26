//
//  HeroesService.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 24/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation
import Moya
import RxSwift

/// Requests related to the user's account
struct HeroService {
    
    let provider = MoyaProvider<Marvel>()
    
    func getHeroes(limit: Int, offset: Int) -> Single<HeroListResponseModel?> {
        return provider.rx
            .request(.heroes(limit: limit, offset: offset))
            .flatMap { response -> Single<HeroListResponseModel?> in
                if let responseType = try? response.map(HeroDataResponseModel.self) {
                    return Single.just(responseType.data)
                } else if let errorType = try? response.map(GeneralError.self) {
                    return Single.error(errorType)
                } else {
                    return Single.error(GeneralError(status: "Unknown Error", code: 000))
                }
            }                      // we map the response to our Codable objects
    }
    
    func getComics(limit: Int, id: Int) -> Single<HeroHqListResponseModel?> {
        return provider.rx
            .request(.comics(id: id, limit: limit))
            .flatMap { response -> Single<HeroHqListResponseModel?> in
                if let responseType = try? response.map(HeroHqDataResponseModel.self) {
                    return Single.just(responseType.data)
                } else if let errorType = try? response.map(GeneralError.self) {
                    return Single.error(errorType)
                } else {
                    return Single.error(GeneralError(status: "Unknown Error", code: 000))
                }
            
            }
    }
}

class GeneralError: Codable, LocalizedError {
    var status: String?
    var code: Int?
    
    init(status: String?, code: Int?) {
        self.status = status
        self.code = code
    }
}
