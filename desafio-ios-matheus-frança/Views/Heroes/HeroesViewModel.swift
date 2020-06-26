//
//  HeroesViewModel.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 19/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation
import RxSwift

class HeroesViewModel {
    var heroesList: [HeroModel] = []
    
    var offset = 0
    var limit = 20
    
    var isFetchingData = false
    
    let disposeBag = DisposeBag()
    let service = HeroService()
    
    func fetchList(success: @escaping () -> Void, error: @escaping (String) -> Void) {
        if isFetchingData {
            return
        }
        isFetchingData = true
        service.getHeroes(limit: limit, offset: offset).subscribe(onSuccess: { [weak self] response in
            self?.isFetchingData = false
            self?.heroesList += HeroModel.mapFrom(response: response?.results)
            self?.offset += self?.limit ?? 0
            success()
        }, onError: { [weak self] errorResponse in
            self?.isFetchingData = false
            error(errorResponse.localizedDescription) //TODO: Criar objeto de erro
        }).disposed(by: disposeBag)
    }
    
    func heroes() -> [HeroModel] {
        return heroesList
    }

    func heroesCount() -> Int {
        return heroesList.count
    }

    func heroForIndex(_ index: Int) -> HeroModel {
        return heroesList[index]
    }
}
