//
//  ProductDetailViewController.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var presenter: ProductDetailPresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProductDetailViewController: ProductDetailViewInterface { }
