//
//  ProductDetailInteractor.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

final class ProductDetailInteractor {
    lazy var apiManager = APIManager()
}

extension ProductDetailInteractor: ProductDetailInteractorInterface {
    
    func getProductInfo(productId: String, completionHandler: @escaping (ProductInfoResult) -> Void) {
        apiManager.request(parameters: EmptyRequest(), endpoint: .productDetail(productId: productId)) {
            (result: Result<ItemResponse>) in
            switch result {
            case .success(let data):
                completionHandler(.success(data))
            case .error:
                completionHandler(.error)
            }
        }
    }
}
