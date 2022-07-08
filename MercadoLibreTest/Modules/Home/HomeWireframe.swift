//
//  HomeWireframe.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import UIKit

final class HomeWireframe: BaseWireframe {

    // MARK: - Module setup -
    init() {
        let moduleViewController = HomeViewController()
        super.init(viewController: moduleViewController)

        let interactor = HomeInteractor()
        let presenter = HomePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -
extension HomeWireframe: HomeWireframeInterface {
    
    func navigateToSearch() {
        navigationController?.pushWireframe(SearchWireframe())
    }
}
