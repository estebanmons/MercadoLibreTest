//
//  HomePresenter.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

final class HomePresenter {

    // MARK: - Private properties -
    private unowned let view: HomeViewInterface
    private let interactor: HomeInteractorInterface
    private let wireframe: HomeWireframeInterface

    // MARK: - Lifecycle -
    init(
        view: HomeViewInterface,
        interactor: HomeInteractorInterface,
        wireframe: HomeWireframeInterface
    ) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -
extension HomePresenter: HomePresenterInterface {
    
    func goToSearch() {
        wireframe.navigateToSearch()
    }
}
