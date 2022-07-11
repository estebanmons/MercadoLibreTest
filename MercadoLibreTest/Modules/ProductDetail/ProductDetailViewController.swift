//
//  ProductDetailViewController.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    // MARK: - Public properties -
    var presenter: ProductDetailPresenterInterface!
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extensions -
extension ProductDetailViewController: ProductDetailViewInterface { }
