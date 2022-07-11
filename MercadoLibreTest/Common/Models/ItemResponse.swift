//
//  ItemResponse.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 11/07/22.
//

import Foundation

// MARK: - ItemResponse
struct ItemResponse: Codable {
    let acceptsMercadopago: Bool?
    let availableQuantity: Int?
    let categoryID: String?
    let condition: Condition?
    let currencyID: String?
    let id: String?
    let location: Location?
    let permalink: String?
    let pictures: [Picture]?
    let price: Double?
    let sellerAddress: SellerAddress
    let sellerID: Int?
    let shipping: Shipping?
    let siteID: String?
    let thumbnail: String?
    let title: String?
    let videoID: String?

    enum CodingKeys: String, CodingKey {
        case acceptsMercadopago = "accepts_mercadopago"
        case availableQuantity = "available_quantity"
        case categoryID = "category_id"
        case condition
        case currencyID = "currency_id"
        case id
        case location
        case permalink
        case pictures
        case price
        case sellerAddress = "seller_address"
        case sellerID = "seller_id"
        case shipping
        case siteID = "site_id"
        case thumbnail
        case title
        case videoID = "video_id"
    }
}

// MARK: - Location
struct Location: Codable {
    let addressLine, zipCode: String?
    let neighborhood, city, state, country: City?

    enum CodingKeys: String, CodingKey {
        case addressLine = "address_line"
        case zipCode = "zip_code"
        case neighborhood, city, state, country
    }
}

// MARK: - City
struct City: Codable {
    let id, name: String?
}

// MARK: - Picture
struct Picture: Codable {
    let id: String?
    let url: String?
    let secureURL: String?
    let quality: String?

    enum CodingKeys: String, CodingKey {
        case id, url
        case secureURL = "secure_url"
        case quality
    }
}

// MARK: - SellerAddress
struct SellerAddress: Codable {
    let city, state, country: City?
    let searchLocation: SearchLocation?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case city, state, country
        case searchLocation = "search_location"
        case id
    }
}

// MARK: - SearchLocation
struct SearchLocation: Codable {
    let city, state: City?
}

enum Condition: String, Codable {
    case new
    case used
}
