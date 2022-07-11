//
//  HomeInterfaces.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

struct ProductListModel {
    let title: String
    let url: String
    let freeShipping: Bool
}

protocol ProductListWireframeInterface: WireframeInterface { }

protocol ProductListViewInterface: ViewInterface {
    func reloadData()
}

protocol ProductListPresenterInterface: PresenterInterface {
    var numberOfItems: Int { get }
    func getItem(at row: Int) -> ProductListModel
    func didSelectItem(row: Int)
}

protocol ProductListInteractorInterface: InteractorInterface {
    func requestSearchMatchesItems(text: String, categoryId: String?, completionHandler: @escaping (SearchMatchesResult) -> Void)
}
