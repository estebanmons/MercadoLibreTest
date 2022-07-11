//
//  EndPoint.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 8/07/22.
//

import Foundation

enum EndPoint {
    case search
    case productDetail(productId: String)
    
    var path: String {
        switch self {
        case .search:
            return baseURL + "sites/MCO/search?q="
        case .productDetail(let productId):
            return baseURL + "items/\(productId)"
        }
    }
    
    var baseURL: String {
        return "https://api.mercadolibre.com/"
    }
}
