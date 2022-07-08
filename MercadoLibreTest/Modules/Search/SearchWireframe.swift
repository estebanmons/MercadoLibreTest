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
extension SearchWireframe: SearchWireframeInterface { }
