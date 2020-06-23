//
//  HeroesViewModel.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 19/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation
//import RxSwift

class HeroesViewModel {
//    let disposeBag = DisposeBag()

    var heroesList: [HeroModel] = []
    
    func fetchList(success: @escaping () -> Void, error: @escaping (String) -> Void) {
        
        let img = "https://s2.glbimg.com/oGOP1N5kCTMEZa35A7OE1zNZsiA=/e.glbimg.com/og/ed/f/original/2020/01/08/baby-yoda.jpg"
        
        self.heroesList = [
            HeroModel(image: img, name: "Herói 1", id: "1"),
            HeroModel(image: img, name: "Herói 2", id: "2"),
            HeroModel(image: img, name: "Herói 3", id: "3"),
            HeroModel(image: img, name: "Herói 4", id: "4"),
            HeroModel(image: img, name: "Herói 5", id: "5")
        ]
        success()
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
