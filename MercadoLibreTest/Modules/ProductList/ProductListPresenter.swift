//
//  HomePresenter.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

final class ProductListPresenter {

    // MARK: - Private properties -
    private unowned let view: ProductListViewInterface
    private let interactor: ProductListInteractorInterface
    private let wireframe: ProductListWireframeInterface
    
    private var categoryId: String?
    private var matchesItems = [ItemResult]()
    private var query: String

    // MARK: - Lifecycle -
    init(
        view: ProductListViewInterface,
        interactor: ProductListInteractorInterface,
        wireframe: ProductListWireframeInterface,
        query: String,
        categoryId: String? = nil
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.query = query
        self.categoryId = categoryId
    }
    
    // MARK: - Private methods -
    private func searchMatchesItems() {
        interactor.requestSearchMatchesItems(text: query, categoryId: categoryId) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let data):
                strongSelf.matchesItems = data
                strongSelf.view.reloadData()
            case .error:
                break
            }
        }
    }
}

// MARK: - Extensions -
extension ProductListPresenter: ProductListPresenterInterface {
    
    var numberOfItems: Int {
        matchesItems.count
    }
    
    func viewDidLoad() {
        searchMatchesItems()
    }
    
    func getItem(at row: Int) -> ProductListModel {
        let item = matchesItems[row]
        return ProductListModel(
            freeShipping: item.shipping?.freeShipping ?? false,
            price: String(item.price?.formatCurrency() ?? "0.0"),
            title: item.title ?? "",
            url: item.thumbnail ?? ""
        )
    }
    
    func didSelectItem(row: Int) {
        guard let productId = matchesItems[row].id else { return }
        wireframe.navigateToProducDetail(productId: productId)
    }
}
