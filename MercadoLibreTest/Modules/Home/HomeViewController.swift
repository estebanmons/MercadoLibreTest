//
//  HomeViewController.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Public properties -
    var presenter: HomePresenterInterface!
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Challenge"
        view.backgroundColor = .yellow
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        
        guard let navigationController = navigationController else { return }

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .yellow
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = UINavigationBar().standardAppearance
        navigationController.navigationBar.isTranslucent = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(didTapSearch)
        )
    }
    
    @objc private func didTapSearch() {
        presenter.goToSearch()
    }
}

// MARK: - Extensions -
extension HomeViewController: HomeViewInterface { }
