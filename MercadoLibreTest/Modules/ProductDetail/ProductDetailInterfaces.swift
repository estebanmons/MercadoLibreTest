//
//  ProductDetailInterfaces.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

protocol ProductDetailWireframeInterface: WireframeInterface { }

protocol ProductDetailViewInterface: ViewInterface { }

protocol ProductDetailPresenterInterface: PresenterInterface { }

protocol ProductDetailInteractorInterface: InteractorInterface {
    func getProductInfo(productId: String)
}
