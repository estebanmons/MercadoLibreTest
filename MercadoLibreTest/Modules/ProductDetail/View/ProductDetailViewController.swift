//
//  ProductDetailViewController.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 7/07/22.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    // MARK: - Private properties -
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private lazy var locationView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var locationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 4.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var locationTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0)
        label.textColor = .darkGray
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var locationAddressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0)
        label.textColor = .black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationCityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0)
        label.textColor = .black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30.0)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20.0)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tagView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20.0)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
        containerView.addSubview(tagView)
        tagView.addSubview(tagLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(locationView)
        locationView.addSubview(locationStackView)
        locationStackView.addArrangedSubview(locationTitleLabel)
        locationStackView.addArrangedSubview(locationAddressLabel)
        locationStackView.addArrangedSubview(locationCityLabel)
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
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16.0),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            
            imagesCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24.0),
            imagesCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imagesCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imagesCollectionView.heightAnchor.constraint(equalToConstant: 200.0),
            
            tagView.topAnchor.constraint(equalTo: imagesCollectionView.bottomAnchor, constant: 16.0),
            tagView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            tagView.widthAnchor.constraint(equalToConstant: 100.0),
            tagView.heightAnchor.constraint(equalToConstant: 30.0),
            
            tagLabel.centerXAnchor.constraint(equalTo: tagView.centerXAnchor),
            tagLabel.centerYAnchor.constraint(equalTo: tagView.centerYAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: tagView.bottomAnchor, constant: 16.0),
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            
            locationView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 16.0),
            locationView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16.0),
            locationView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16.0),
            
            locationStackView.topAnchor.constraint(equalTo: locationView.topAnchor),
            locationStackView.leadingAnchor.constraint(equalTo: locationView.leadingAnchor),
            locationStackView.trailingAnchor.constraint(equalTo: locationView.trailingAnchor),
            locationStackView.bottomAnchor.constraint(equalTo: locationView.bottomAnchor)
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
        tagView.layer.cornerRadius = 4.0
        tagView.layer.masksToBounds = true
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
        locationAddressLabel.text = model.address
        locationTitleLabel.text = Constants.ProductDetail.sellerLocation
        locationTitleLabel.sizeToFit()
        locationAddressLabel.sizeToFit()
        locationCityLabel.text = model.city
        locationCityLabel.sizeToFit()
        switch model.condition {
        case .new:
            tagLabel.text = Constants.Condition.new
            tagView.backgroundColor = .systemGreen
        case .used:
            tagLabel.text = Constants.Condition.used
            tagView.backgroundColor = .systemOrange
        }
        
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
        let counter = "\(indexPath.row + 1) / \(presenter.numberOfPictures)"
        cell.setData(with: presenter.getItemImage(at: indexPath.row), counter: counter)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: imagesCollectionView.frame.size.width, height: imagesCollectionView.frame.size.height)
    }
}
