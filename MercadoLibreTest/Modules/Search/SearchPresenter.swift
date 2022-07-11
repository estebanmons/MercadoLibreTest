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
    
    private var matchesItems = [MatchesItemsModel]()

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
        return item
    }
    
    func searchItems(text: String) {
        interactor.requestSearchMatchesItems(text: text) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let data):
                strongSelf.matchesItems = []
                data.forEach { item in
                    strongSelf.matchesItems.append(MatchesItemsModel(match: item.title ?? ""))
                }
                strongSelf.view.reloadData()
            case .error:
                break
            }
        }
    }
}
