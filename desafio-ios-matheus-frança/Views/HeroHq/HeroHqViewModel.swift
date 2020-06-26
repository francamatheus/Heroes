//
//  HeroHqViewModel.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 19/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation
import RxSwift

class HeroHqViewModel {
    
    let disposeBag = DisposeBag()
    let service = HeroService()
    
    var heroHqData: HeroHqModel?
    
    var limit = 20
    
    var heroId: Int?
    
    func fetchList(success: @escaping () -> Void, error: @escaping (String) -> Void) {
        
        service.getComics(limit: limit, id: heroId ?? 0).subscribe(onSuccess: { [weak self] response in
            self?.getMostExpensiveHq(hqs: HeroHqModel.mapFrom(response: response?.results))
            if self?.heroHqData == nil {
                error("This hero doesn't have any HQs")
            } else {
               success()
            }
            }, onError: { errorResponse in
                error(errorResponse.localizedDescription) //TODO: Criar objeto de erro
        }).disposed(by: disposeBag)
    }
    
    func getMostExpensiveHq(hqs: [HeroHqModel]) {
        hqs.forEach { (hq) in
            if hq.price > heroHqData?.price ?? 0 {
                self.heroHqData = hq
            }
        }
    }
}
