//
//  SearchViewController.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import UIKit

final class SearchViewController: UIViewController {
    
    lazy var resultsTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.allowsSelectionDuringEditing = false
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Private properties -
    private var searchController = UISearchController()
    private var cell = "cell"
    
    // MARK: - Public properties -
    var presenter: SearchPresenterInterface!
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setSearchController()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.searchController.isActive = true
    }
    
    private func setSearchController() {
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = false
        self.definesPresentationContext = true
        navigationItem.searchController = searchController
    }
    
    private func setupTableView() {
        view.addSubview(resultsTableView)
        NSLayoutConstraint.activate([
            resultsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            resultsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        resultsTableView.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        resultsTableView.dataSource = self
        resultsTableView.delegate = self
    }
}

// MARK: - Extensions -
extension SearchViewController: SearchViewInterface {
    
    func reloadData() {
        resultsTableView.reloadData()
    }
}

// MARK: - Extensions  UISearch -
extension SearchViewController: UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    
    func willPresentSearchController(_ searchController: UISearchController) {
        DispatchQueue.main.async { [weak self] in
            guard let stronSelf = self else { return }
            stronSelf.searchController.searchBar.becomeFirstResponder()
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchText = searchController.searchBar.text, searchText.count > 2 else { return }
        
        if searchText.rangeOfCharacter(from: .whitespacesAndNewlines) != nil {
            let safeString = searchText.replacingOccurrences(of: " ", with: "%20")
            presenter.searchItems(text: safeString)
        } else {
            presenter.searchItems(text: searchText)
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

// MARK: - Extensions  UITableView -
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath)
        cell.textLabel?.text = presenter.getItem(at: indexPath.row).match
        cell.imageView?.image = UIImage(systemName: "heart.fill")
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
