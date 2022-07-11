//
//  ProductDetailViewController.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .darkText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16.0)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var index: Int = 0
    
    // MARK: - Public properties -
    var presenter: ProductDetailPresenterInterface!
    
    // MARK: - Life cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.Title.productDetail
        setupView()
        presenter.viewDidLoad()
    }
    
    private func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(imagesCollectionView)
        containerView.addSubview(priceLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8.0),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0),
            
            imagesCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
            imagesCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imagesCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imagesCollectionView.heightAnchor.constraint(equalToConstant: 200.0),
            
            priceLabel.topAnchor.constraint(equalTo: imagesCollectionView.bottomAnchor, constant: 8.0),
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8.0),
            priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8.0)
        ])
    }
    
    private func setupCollectionView() {
        imagesCollectionView.register(
            UINib(
                nibName: "ImageCollectionViewCell",
                bundle: nil
            ),
            forCellWithReuseIdentifier: "ImageCell"
        )
        
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0.0
        flowLayout.minimumInteritemSpacing = 0.0
        imagesCollectionView.collectionViewLayout = flowLayout
        imagesCollectionView.isPagingEnabled = true
    }
    
    private func setupView() {
        addViews()
        setConstraints()
        setupCollectionView()
    }
    
}

// MARK: - Extensions -
extension ProductDetailViewController: ProductDetailViewInterface {
    
    func setData(with model: ItemDetailModel) {
        titleLabel.text = model.title
        priceLabel.text = model.price
        imagesCollectionView.reloadData()
    }
}

// MARK: - Extensions UICollectionView -
extension ProductDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfPictures
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath)
        guard let cell = collectionViewCell as? ImageCollectionViewCell else { return collectionViewCell }
        cell.setImage(with: presenter.getItemImage(at: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: imagesCollectionView.frame.size.width, height: imagesCollectionView.frame.size.height)
    }
}
