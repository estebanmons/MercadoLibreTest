//
//  ProductDetailInterfaces.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

enum ProductInfoResult {
    case success(ItemResponse)
    case error
}

struct ItemDetailModel {
    let title: String
    let price: String
}

protocol ProductDetailWireframeInterface: WireframeInterface { }

protocol ProductDetailViewInterface: ViewInterface {
    func setData(with model: ItemDetailModel)
}

protocol ProductDetailPresenterInterface: PresenterInterface {
    var numberOfPictures: Int { get }
    func getItemImage(at row: Int) -> String
}

protocol ProductDetailInteractorInterface: InteractorInterface {
    func getProductInfo(productId: String, completionHandler: @escaping (ProductInfoResult) -> Void)
}
