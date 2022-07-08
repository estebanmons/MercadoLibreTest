//
//  HomeInterfaces.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import Foundation

protocol HomeWireframeInterface: WireframeInterface {
    func navigateToSearch()
}

protocol HomeViewInterface: ViewInterface { }

protocol HomePresenterInterface: PresenterInterface {
    func goToSearch()
}

protocol HomeInteractorInterface: InteractorInterface { }
