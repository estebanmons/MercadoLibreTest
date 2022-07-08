//
//  SearchViewController.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import UIKit

final class SearchViewController: UIViewController {
    
    var presenter: SearchPresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension SearchViewController: SearchViewInterface { }
