//
//  Double.swift
//  MercadoLibreTest
//
//  Created by Esteban Monsalve on 11/07/22.
//

import Foundation

extension Double {
    
    func formatCurrency() -> String? {
         let formatter = NumberFormatter()
         formatter.numberStyle = .currencyAccounting
         formatter.maximumFractionDigits = 0
         formatter.locale = Locale(identifier: "es_CO")
         let result = formatter.string(from: self as NSNumber)
         return result
    }
}
