//
//  ImageCollectionViewCell.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 11/07/22.
//

import UIKit
import Kingfisher

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    // MARK: - Public methods -
    func setData(with url: String) {
        if let imageURL = URL(string: (url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "")) {
            let placeholder = UIImage(named: Constants.ProductDetail.noImage)
            imageView.kf.setImage(with: imageURL, placeholder: placeholder)
            imageView.contentMode = .scaleAspectFit
        }
    }
}
