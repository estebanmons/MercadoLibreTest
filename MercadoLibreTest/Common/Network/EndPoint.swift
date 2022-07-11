//
//  EndPoint.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 8/07/22.
//

import Foundation

enum EndPoint {
    case search
    case productDetail
    
    var path: String {
        switch self {
        case .search:
            return baseURL + "sites/MCO/search?q="
        case .productDetail:
            return baseURL + "items/"
        }
    }
    
    var baseURL: String {
        return "https://api.mercadolibre.com/"
    }
}
