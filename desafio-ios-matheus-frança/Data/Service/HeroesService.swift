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
    
    func getHeroes(limit: Int, offset: Int) -> Single<HeroesResponseModel?> {
        return provider.rx
            .request(.heroes(limit: limit, offset: offset))
            .flatMap { response -> Single<HeroesResponseModel?> in
                if let responseType = try? response.map(HeroesDataResponseModel.self) {
                    return Single.just(responseType.data)
                    //               } else if let errorType = try? response.map(UserError.self) {
                    //                   return Single.error(errorType.error)
                } else {
                    fatalError("⛔️ We don't know how to parse that!")
                }
            }                      // we map the response to our Codable objects
    }
    
    func getComics(limit: Int, id: Int) -> Single<HeroHqsResponseModel?> {
        return provider.rx
            .request(.comics(id: id, limit: limit))
            .flatMap { response -> Single<HeroHqsResponseModel?> in
                if let responseType = try? response.map(HeroHqDataResponseModel.self) {
                    return Single.just(responseType.data)
                    //               } else if let errorType = try? response.map(UserError.self) {
                    //                   return Single.error(errorType.error)
                } else {
                    fatalError("⛔️ We don't know how to parse that!")
                }
            }
    }
}

//TODO: Handle Error
