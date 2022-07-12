//
//  HomeInterfaces.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

struct ProductListModel {
    let freeShipping: Bool
    let price: String
    let title: String
    let url: String
}

protocol ProductListWireframeInterface: WireframeInterface {
    func navigateToProducDetail(productId: String)
    func goToBack()
}

protocol ProductListViewInterface: ViewInterface {
    func reloadData()
    func showNoResults()
}

protocol ProductListPresenterInterface: PresenterInterface {
    var numberOfItems: Int { get }
    func getItem(at row: Int) -> ProductListModel
    func didSelectItem(row: Int)
}

protocol ProductListInteractorInterface: InteractorInterface {
    func requestSearchMatchesItems(text: String, categoryId: String?, completionHandler: @escaping (SearchMatchesResult) -> Void)
}
