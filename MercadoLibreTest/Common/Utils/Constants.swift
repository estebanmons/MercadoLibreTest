//
//  Constants.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 11/07/22.
//

import Foundation

struct Constants {
    
    struct Title {
        static let productDetail = "Detalle"
        static let productList = "Resultados"
        static let search = "Mercado Libre"
    }
    
    struct ProductDetail {
        static let sellerLocation = "Ubicación del vendedor"
        static let noImage = "no-image"
        static let attributes = "Características"
    }
    
    struct ProductList {
        static let freeShipping = "Envío gratis"
        static let chargedShipping = "Envío con cargo"
        static let noResults = "No se encontraron resultados para esta búsqueda"
    }
    
    struct Search {
        static let searchPlaceholder = "Buscar en Mercado Libre"
        static let searchImage = "magnifyingglass.circle.fill"
    }
    
    struct Condition {
        static let new = "Nuevo"
        static let used = "Usado"
    }
    
    struct Alert {
        static let accept = "Aceptar"
        static let title = "Advertencia"
        static let message = "Se ha producido un incoveniente, vuelve a reintentar por favor."
    }
}
