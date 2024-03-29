//
//  HomeViewController.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import UIKit

final class ProductListViewController: UIViewController {
    
    private lazy var productListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var noResultsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18.0)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = Constants.ProductList.noResults
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Public properties -
    var presenter: ProductListPresenterInterface!
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Title.productList
        view.backgroundColor = .systemGray6
        configureNavigationBar()
        setupView()
        presenter.viewDidLoad()
    }
    
    private func configureNavigationBar() {
        guard let navigationController = navigationController else { return }
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .yellow
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = UINavigationBar().standardAppearance
        navigationController.navigationBar.isTranslucent = false
    }
    
    private func setupCollectionView() {
        productListCollectionView.register(
            UINib(
                nibName: "ProducListCollectionViewCell",
                bundle: nil
            ),
            forCellWithReuseIdentifier: "ProductListCell"
        )
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize.height = 230.0
        flowLayout.itemSize.width = (productListCollectionView.frame.size.width - CGFloat(10)) / CGFloat(2)
        flowLayout.minimumLineSpacing = 10.0
        productListCollectionView.collectionViewLayout = flowLayout
        
        productListCollectionView.delegate = self
        productListCollectionView.dataSource = self
    }
    
    private func addViews() {
        view.addSubview(productListCollectionView)
        view.addSubview(noResultsLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            productListCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8.0),
            productListCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8.0),
            productListCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8.0),
            productListCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8.0),
            
            noResultsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            noResultsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            noResultsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8.0),
            noResultsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8.0)
        ])
    }
    
    private func setupView() {
        addViews()
        setConstraints()
        setupCollectionView()
        noResultsLabel.isHidden = true
    }
}

// MARK: - Extensions
extension ProductListViewController: ProductListViewInterface {
    
    func reloadData() {
        noResultsLabel.isHidden = true
        productListCollectionView.reloadData()
    }
    
    func showNoResults() {
        noResultsLabel.isHidden = false
    }
}

// MARK: - Extensions UICollectionView -
extension ProductListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductListCell", for: indexPath)
        guard let cell = collectionViewCell as? ProducListCollectionViewCell else { return collectionViewCell }
        cell.setData(with: presenter.getItem(at: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (productListCollectionView.frame.size.width - CGFloat(10)) / CGFloat(2)
        return CGSize(width: size, height: 230.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(row: indexPath.row)
    }
}
