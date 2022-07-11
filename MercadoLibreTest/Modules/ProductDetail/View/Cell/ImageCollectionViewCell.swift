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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func setImage(with url: String) {
        if let imageURL = URL(string: (url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "")) {
            imageView.kf.setImage(with: imageURL)
            imageView.contentMode = .scaleAspectFit
        }
    }
}
