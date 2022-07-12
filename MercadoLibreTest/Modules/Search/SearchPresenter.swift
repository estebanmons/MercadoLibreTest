//
//  SearchPresenter.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

struct MatchesItemsModel {
    let match: String
}

final class SearchPresenter {

    // MARK: - Private properties -
    private unowned let view: SearchViewInterface
    private let interactor: SearchInteractorInterface
    private let wireframe: SearchWireframeInterface
    
    private var matchesItems = [ItemResult]()
    private var query: String = ""

    // MARK: - Lifecycle -
    init(
        view: SearchViewInterface,
        interactor: SearchInteractorInterface,
        wireframe: SearchWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -
extension SearchPresenter: SearchPresenterInterface {
    
    var numberOfItems: Int {
        matchesItems.count
    }
    
    func getItem(at row: Int) -> MatchesItemsModel {
        let item = matchesItems[row]
        return MatchesItemsModel(match: item.title ?? "")
    }
    
    func searchItems(with text: String) {
        query = text
        interactor.requestSearchMatchesItems(text: text) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let data):
                strongSelf.matchesItems = []
                strongSelf.matchesItems = data
                strongSelf.view.reloadData()
            case .error:
                strongSelf.wireframe.showAlertWithAction(Constants.Alert.title, message: Constants.Alert.message) { return }
            }
        }
    }
    
    func didSelectItem(row: Int) {
        let item = matchesItems[row]
        wireframe.navigateToProductList(query: query, categoryId: item.categoryId)
    }
    
    func goToProductList(with text: String) {
        wireframe.navigateToProductList(query: query, categoryId: nil)
    }
    
    func resetData() {
        matchesItems = []
        view.reloadData()
    }
}
