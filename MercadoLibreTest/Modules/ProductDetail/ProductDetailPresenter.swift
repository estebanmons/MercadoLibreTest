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

    // MARK: - Lifecycle -
    init(
        view: ProductDetailViewInterface,
        interactor: ProductDetailInteractorInterface,
        wireframe: ProductDetailWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -
extension ProductDetailPresenter: ProductDetailPresenterInterface { }
