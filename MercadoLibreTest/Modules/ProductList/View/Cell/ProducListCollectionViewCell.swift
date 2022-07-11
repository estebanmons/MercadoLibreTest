//
//  ProducListCollectionViewCell.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 11/07/22.
//

import UIKit
import Kingfisher

class ProducListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var freeShippingLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
        titleLabel.text = nil
        freeShippingLabel.text = nil
    }
    
    private func setupView() {
        titleLabel.font = .systemFont(ofSize: 16.0)
        titleLabel.textColor = .darkGray
        freeShippingLabel.font = .boldSystemFont(ofSize: 13)
        freeShippingLabel.textColor = .systemGreen
    }
    
    func setData(with model: ProductListModel) {
        if let imageURL = URL(string: (model.url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "")) {
            productImageView.kf.setImage(with: imageURL)
        }
        titleLabel.text = model.title
        freeShippingLabel.text = model.freeShipping ? "Envio gratis" : "Con costo"
    }
}
