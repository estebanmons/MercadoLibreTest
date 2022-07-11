//
//  MatchesItemsResponse.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 8/07/22.
//

import Foundation

// MARK: - MatchesItemsResponse
struct MatchesItemsResponse: Codable {
    let countryDefaultTimeZone: String?
    let paging: Paging?
    let query: String?
    let results: [ItemResult]?
    let siteId: SiteID?

    enum CodingKeys: String, CodingKey {
        case countryDefaultTimeZone = "country_default_time_zone"
        case paging
        case query
        case results
        case siteId = "site_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        countryDefaultTimeZone = try? container.decode(String.self, forKey: .countryDefaultTimeZone)
        paging = try? container.decode(Paging.self, forKey: .paging)
        query = try? container.decode(String.self, forKey: .query)
        results = try? container.decodeSafelyArray(ItemResult.self, forKey: .results)
        siteId = try? container.decode(SiteID.self, forKey: .siteId)
    }
}

// MARK: - Paging
struct Paging: Codable {
    let total, primaryResults, offset, limit: Int?

    enum CodingKeys: String, CodingKey {
        case total
        case primaryResults = "primary_results"
        case offset, limit
    }
}

enum SiteID: String, Codable {
    case mco = "MCO"
}

// MARK: - Result
struct ItemResult: Codable {
    let categoryId: String?
    let currencyId: CurrencyID?
    let id: String?
    let price: Double?
    let shipping: Shipping?
    let thumbnail: String?
    let title: String?
    
    enum CodingKeys: String, CodingKey {
        case categoryId = "category_id"
        case currencyId = "currency_id"
        case id
        case price
        case shipping
        case thumbnail
        case title
    }
}

// MARK: - Shipping
struct Shipping: Codable {
    let freeShipping: Bool?
    let mode: Mode?
    let tags: [ShippingTag]?
    let logisticType: LogisticType?
    let storePickUp: Bool?

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case mode, tags
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
}

enum Mode: String, Codable {
    case me2 = "me2"
    case notSpecified = "not_specified"
}

enum CurrencyID: String, Codable {
    case cop = "COP"
}

enum ShippingTag: String, Codable {
    case fbmInProcess = "fbm_in_process"
    case fsThresholdMcoChangeApr2021 = "fs_threshold_mco_change_apr2021"
    case fsThresholdMcoChangeJul2021 = "fs_threshold_mco_change_jul2021"
    case fulfillment = "fulfillment"
    case mandatoryFreeShipping = "mandatory_free_shipping"
    case selfServiceIn = "self_service_in"
    case selfServiceOut = "self_service_out"
}

enum LogisticType: String, Codable {
    case crossDocking = "cross_docking"
    case dropOff = "drop_off"
    case fulfillment = "fulfillment"
    case notSpecified = "not_specified"
    case xdDropOff = "xd_drop_off"
}

extension KeyedDecodingContainer {
    
    public func decodeSafelyArray<T>(_ type: T.Type, forKey key: Self.Key) throws -> [T] where T: Decodable {
        let array = decodeSafely([SafeDecoding<T>].self, forKey: key)
        
        if array?.isEmpty == true || array?.allSatisfy({ $0.value == nil }) == false {
            return array?.compactMap({ element -> T? in
                return element.value
            }) ?? []
        } else {
            throw ArrayDecodingError.dataCorrupted
        }
    }
    
    public func decodeSafely<T>(_ key: Self.Key) -> T? where T: Decodable {
        return self.decodeSafely(T.self, forKey: key)
    }

    public func decodeSafely<T>(_ type: T.Type, forKey key: Self.Key) -> T? where T: Decodable {
        let decoded = try? decode(SafeDecoding<T>.self, forKey: key)
        return decoded?.value
    }
    
    public func decode(_ type: Decimal.Type, forKey key: Self.Key) throws -> Decimal? {
        if let doubleValue = try? decode(Double.self, forKey: key) {
            return Decimal(string: "\(doubleValue)")
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return Decimal(string: stringValue)
        } else {
            return nil
        }
    }
    
    public func decodeIfPresent(_ type: Decimal.Type, forKey key: Self.Key) throws -> Decimal? {
        if let doubleValue = try? decode(Double.self, forKey: key) {
            return Decimal(string: "\(doubleValue)")
        } else if let stringValue = try? decode(String.self, forKey: key) {
            return Decimal(string: stringValue)
        } else {
            return nil
        }
    }

    public func decode(_ type: Decimal.Type, forKey key: Self.Key) throws -> Decimal {
        var value = String()
        if let doubleValue: Double = try? decode(Double.self, forKey: key) {
            value = "\(doubleValue)"
        } else if let stringValue: String = try? decode(String.self, forKey: key) {
            value = stringValue
        }
        guard let decimalValue = Decimal(string: value) else {
            let context = DecodingError.Context(codingPath: [key], debugDescription: "The key \(key) couldn't be converted to a Decimal value")
            throw DecodingError.typeMismatch(type, context)
        }
        return decimalValue
    }
}

public struct SafeDecoding<T: Decodable>: Decodable {
    public let value: T?
    public var decodingError: String?

    public init(from decoder: Decoder) throws {
        do {
            let container = try decoder.singleValueContainer()
            value = try container.decode(T.self)
        } catch let error {
            let reason: String
            if let decodingError = error as? DecodingError {
                switch decodingError {
                case .typeMismatch(let type, let context):
                    reason = "Type '\(type)' mismatch: \(context.debugDescription) - codingPath: \(context.codingPath)"
                case .valueNotFound(let value, let context):
                    reason = "Value '\(value)' not found: \(context.debugDescription) - codingPath: \(context.codingPath)"
                case .keyNotFound(let key, let context):
                    reason = "Key '\(key)' not found: \(context.debugDescription) - codingPath: \(context.codingPath)"
                case .dataCorrupted(let context):
                    reason = "\(context)"
                default:
                    reason = error.localizedDescription
                }
            } else {
                reason = error.localizedDescription
            }
            decodingError = reason
            value = nil
        }
    }
}

enum ArrayDecodingError: Error {
    case dataCorrupted
}
