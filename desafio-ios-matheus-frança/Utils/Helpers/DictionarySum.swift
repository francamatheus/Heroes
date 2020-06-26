//
//  DictionarySum.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 26/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation

func +<Key, Value> (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] {
    var result = lhs
    rhs.forEach {
        result[$0] = $1
    }
    return result
}
