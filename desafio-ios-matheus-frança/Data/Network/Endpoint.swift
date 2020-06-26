//
//  Endpoint.swift
//  desafio-ios-matheus-frança
//
//  Created by matheus.s.franca on 24/06/20.
//  Copyright © 2020 matheus.s.franca. All rights reserved.
//

import Foundation
import Moya

enum Marvel {
    
    static private let publicKey = "11b46be8855ddfe3b06a2aa8aa5b8eb6"
    static private let privateKey = "427505f79b211a89e487b9ef45415aca07358f1a"
    
    case comics(id: Int, limit: Int)
    case heroes(limit: Int, offset: Int)
}

extension Marvel: TargetType {
    public var baseURL: URL {
        return URL(string: "https://gateway.marvel.com/v1/public")!
    }
    
    public var path: String {
        switch self {
        case .comics(let id, _):
            return "/characters/\(id)/comics"
        case .heroes:
            return "/characters"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .comics:
            return .get
        case .heroes:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        let ts = "\(Date().timeIntervalSince1970)"
        let hash = (ts + Marvel.privateKey + Marvel.publicKey).md5
        let authParams = ["apikey": Marvel.publicKey, "ts": ts, "hash": hash]
        
        switch self {
        case .comics(_, let limit):
            return .requestParameters(parameters: authParams + ["limit": limit],
                                      encoding: URLEncoding.default)
        case .heroes(let limit, let offset):
            return .requestParameters(parameters: authParams + ["limit": limit, "offset": offset],
                                      encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}

func +<Key, Value> (lhs: [Key: Value], rhs: [Key: Value]) -> [Key: Value] { // TODO: File for helper
    var result = lhs
    rhs.forEach {
        result[$0] = $1
    }
    return result
}
