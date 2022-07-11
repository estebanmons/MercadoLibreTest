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
    let address: String
    let city: String
    let price: String
    let title: String
    let condition: Condition
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
