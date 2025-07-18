//
//  LanguageListModel.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 23/05/25.
//

import Foundation

/*struct LanguageListModel: Codable {
    
    let flageBaseURL = "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/"
    
    var selected: String = ""
    
    let name: String
    let code: String
    let capital: String
    let region: String
    var currency: CountryCurrency
    var language: CountryLanguage
    var flag: String
    let diallingCode: String
    let isoCode: String

    enum CodingKeys: String, CodingKey {
        case name
        case code
        case capital
        case region
        case currency
        case language
        case flag
        case diallingCode = "dialling_code"
        case isoCode
        
    }
}

struct CountryCurrency: Codable {
    let code: String
    let name: String
    var symbol: String?
}

struct CountryLanguage: Codable {
    var code: String?
    let name: String
}*/


// MARK: - Root Model
struct LanguageListModel: Codable {
    var indexNumber: Int
    let code: String
    let name: String
    let nativeName: String
}

struct Language: Codable {
    var language: [String: LanguageDetail]
    
    enum CodingKeys: String, CodingKey {
        case language = "lang"
    }
}

// MARK: - Language Detail
struct LanguageDetail: Codable {
    let name: String
    let nativeName: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case nativeName
    }
}
