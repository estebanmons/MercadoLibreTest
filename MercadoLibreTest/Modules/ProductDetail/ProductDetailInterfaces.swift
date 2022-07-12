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

struct AttributeModel {
    let name: String
    let value: String
}

protocol ProductDetailWireframeInterface: WireframeInterface {
    func goToBack()
}

protocol ProductDetailViewInterface: ViewInterface {
    func setData(with model: ItemDetailModel)
}

protocol ProductDetailPresenterInterface: PresenterInterface {
    var numberOfPictures: Int { get }
    var numberOfAttributes: Int { get }
    func getItemImage(at row: Int) -> String
    func getAttribute(at row: Int) -> AttributeModel
}

protocol ProductDetailInteractorInterface: InteractorInterface {
    func getProductInfo(productId: String, completionHandler: @escaping (ProductInfoResult) -> Void)
}
