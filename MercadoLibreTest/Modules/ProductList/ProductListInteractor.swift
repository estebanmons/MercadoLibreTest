//
//  HomeInteractor.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

final class ProductListInteractor {
    lazy var apiManager = APIManager()
}

extension ProductListInteractor: ProductListInteractorInterface {
    
    func requestSearchMatchesItems(text: String, categoryId: String?, completionHandler: @escaping (SearchMatchesResult) -> Void) {
        let parameters = MatchesItemsRequest(query: text, limit: 8, category: categoryId)
        apiManager.request(
            parameters: parameters,
            endpoint: .search
        ) { (result: Result<MatchesItemsResponse>) in
            switch result {
            case .success(let data):
                guard let results = data.results else { return }
                completionHandler(.success(results))
            case .error:
                completionHandler(.error)
            }
        }
    }
}
