//
//  SearchInterfaces.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

enum SearchMatchesResult {
    case success([ItemResult])
    case error
}

struct MatchesItemsRequest: Encodable {
    let query: String
    let limit: Int
    let category: String?
    
    enum CodingKeys: String, CodingKey {
        case query = "q"
        case limit
        case category
    }
}

protocol SearchWireframeInterface: WireframeInterface {
    func navigateToProductList(query: String, categoryId: String?)
}

protocol SearchViewInterface: ViewInterface {
    func reloadData()
}

protocol SearchPresenterInterface: PresenterInterface {
    var numberOfItems: Int { get }
    func getItem(at row: Int) -> MatchesItemsModel
    func searchItems(with text: String)
    func didSelectItem(row: Int)
    func goToProductList(with text: String)
    func resetData()
}

protocol SearchInteractorInterface: InteractorInterface {
    func requestSearchMatchesItems(text: String, completionHandler: @escaping (SearchMatchesResult) -> Void)
}
