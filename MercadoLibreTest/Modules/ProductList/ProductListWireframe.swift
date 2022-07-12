//
//  HomeWireframe.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import UIKit

final class ProductListWireframe: BaseWireframe {

    // MARK: - Module setup -
    init(query: String, categoryId: String?) {
        let moduleViewController = ProductListViewController()
        super.init(viewController: moduleViewController)

        let interactor = ProductListInteractor()
        let presenter = ProductListPresenter(
            view: moduleViewController,
            interactor: interactor,
            wireframe: self,
            query: query,
            categoryId: categoryId
        )
        moduleViewController.presenter = presenter
    }
}

// MARK: - Extensions -
extension ProductListWireframe: ProductListWireframeInterface {
    
    func navigateToProducDetail(productId: String) {
        navigationController?.pushWireframe(ProductDetailWireframe(productId: productId), animated: true)
    }
    
    func goToBack() {
        navigationController?.popViewController(animated: true)
    }
}
