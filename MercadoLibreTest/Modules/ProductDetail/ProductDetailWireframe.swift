//
//  ProductDetailWireframe.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

final class ProductDetailWireframe: BaseWireframe {

    // MARK: - Module setup -
    init() {
        let moduleViewController = ProductDetailViewController()
        super.init(viewController: moduleViewController)

        let interactor = ProductDetailInteractor()
        let presenter = ProductDetailPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -
extension ProductDetailWireframe: ProductDetailWireframeInterface { }
