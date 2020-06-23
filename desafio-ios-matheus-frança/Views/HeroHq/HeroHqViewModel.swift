//
//  HeroHqViewModel.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 19/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation
//import RxSwift

class HeroHqViewModel {
//    let disposeBag = DisposeBag()

    var heroHqData: HeroHqModel?
    
    func fetchList(success: @escaping () -> Void, error: @escaping (String) -> Void) {
        
        let img = "https://s2.glbimg.com/oGOP1N5kCTMEZa35A7OE1zNZsiA=/e.glbimg.com/og/ed/f/original/2020/01/08/baby-yoda.jpg"
        
        self.heroHqData = HeroHqModel(image: img, title: "Carlosss", id: "1", price: "10,00")
        success()
    }
}
