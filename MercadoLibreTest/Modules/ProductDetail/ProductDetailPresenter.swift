//
//  ProductDetailPresenter.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

final class ProductDetailPresenter {

    // MARK: - Private properties -
    private unowned let view: ProductDetailViewInterface
    private let interactor: ProductDetailInteractorInterface
    private let wireframe: ProductDetailWireframeInterface
    
    private var productId: String?

    // MARK: - Lifecycle -
    init(
        view: ProductDetailViewInterface,
        interactor: ProductDetailInteractorInterface,
        wireframe: ProductDetailWireframeInterface,
        productId: String? = nil
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.productId = productId
    }
}

// MARK: - Extensions -
extension ProductDetailPresenter: ProductDetailPresenterInterface {
    
    func viewDidLoad() {
        guard let productId = productId else { return }
        interactor.getProductInfo(productId: productId)
    }
}
