//
//  ImageCollectionViewCell.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 11/07/22.
//

import UIKit
import Kingfisher

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var counterView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Life cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        counterLabel.text = nil
    }
    
    // MARK: - Private methods -
    func setupView() {
        counterLabel.font = .systemFont(ofSize: 14.0)
        counterLabel.textColor = .black
        counterView.backgroundColor = .systemGray6
        counterView.layer.cornerRadius = 4
        counterView.layer.masksToBounds = true
    }
    
    // MARK: - Public methods -
    func setData(with url: String, counter: String) {
        if let imageURL = URL(string: (url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "")) {
            imageView.kf.setImage(with: imageURL)
            imageView.contentMode = .scaleAspectFit
        }
        counterLabel.text = counter
    }
}
