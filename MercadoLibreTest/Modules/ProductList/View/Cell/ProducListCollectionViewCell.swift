//
//  ProducListCollectionViewCell.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 11/07/22.
//

import UIKit
import Kingfisher

class ProducListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var productView: UIView!
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var freeShippingLabel: UILabel!

    // MARK: - Life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productView.setNeedsLayout()
        productView.layoutIfNeeded()
        productView.layer.shadowPath = UIBezierPath(roundedRect: contentView.bounds, cornerRadius: 4).cgPath
        productView.layer.masksToBounds = false
        productView.layer.shadowOffset = CGSize(width: 0, height: 4)
        productView.layer.shadowOpacity = 1
        productView.layer.shadowColor = UIColor(red: 0.19, green: 0.28, blue: 0.38, alpha: 0.08).cgColor
        productView.layer.cornerRadius = 4.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
        titleLabel.text = nil
        freeShippingLabel.text = nil
    }
    
    // MARK: - Private methods -
    private func setupView() {
        titleLabel.font = .systemFont(ofSize: 16.0)
        titleLabel.textColor = .darkGray
        freeShippingLabel.font = .boldSystemFont(ofSize: 13)
        freeShippingLabel.textColor = .systemGreen
    }
    
    // MARK: - Public methods -
    func setData(with model: ProductListModel) {
        if let imageURL = URL(string: (model.url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "")) {
            productImageView.kf.setImage(with: imageURL)
            productImageView.contentMode = .scaleAspectFit
        }
        titleLabel.text = model.title
        freeShippingLabel.text = model.freeShipping ? Constants.ProductList.freeShipping : Constants.ProductList.chargedShipping
    }
}
