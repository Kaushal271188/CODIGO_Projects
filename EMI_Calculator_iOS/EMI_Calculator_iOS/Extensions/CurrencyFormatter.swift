//
//  CurrencyFormatter.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 30/07/25.
//

import Foundation

class CurrencyFormatter {

    static let shared = CurrencyFormatter()
    
    func format(amount: Double,
                currencyCode: String = "USD") -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode

        if let localeId = self.getLocaleIdentifiers(currencyCode: currencyCode).first {
            formatter.locale = Locale(identifier: localeId)
        }else {
            formatter.locale = Locale.current
        }
        
        return formatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
    }
    
    func getLocaleIdentifiers(currencyCode: String) -> [String] {
        return Locale.availableIdentifiers.filter { identifier in
            let locale = Locale(identifier: identifier)
            return locale.currencyCode == currencyCode
        }
    }
}

