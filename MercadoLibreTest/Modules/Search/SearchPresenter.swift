//
//  SearchPresenter.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

final class SearchPresenter {

    // MARK: - Private properties -
    private unowned let view: SearchViewInterface
    private let interactor: SearchInteractorInterface
    private let wireframe: SearchWireframeInterface

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
extension SearchPresenter: SearchPresenterInterface { }
