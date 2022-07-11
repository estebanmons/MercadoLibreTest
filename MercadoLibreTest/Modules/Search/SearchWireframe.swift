//
//  SearchWireframe.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import UIKit

final class SearchWireframe: BaseWireframe {

    // MARK: - Module setup -
    init() {
        let moduleViewController = SearchViewController()
        super.init(viewController: moduleViewController)

        let interactor = SearchInteractor()
        let presenter = SearchPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -
extension SearchWireframe: SearchWireframeInterface {
    
    func navigateToProductList(query: String, categoryId: String?) {
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(ProductListWireframe(query: query, categoryId: categoryId).viewController, animated: true)
    }
}
