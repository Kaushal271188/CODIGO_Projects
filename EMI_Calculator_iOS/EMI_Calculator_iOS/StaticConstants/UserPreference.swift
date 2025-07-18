//
//  UserPreference.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 22/05/25.
//

import Foundation

class UserPreference {
    
    enum PreferenceName: String {
        case SelectedCountryInfo = "SelectedCountryInfo"
        case SelectedLanguageInfo = "SelectedLanguageInfo"
        case SelectedCurrencyInfo = "SelectedCurrencyInfo"
    }
    
    enum ObjectSavableError: String, LocalizedError {
        case unableToEncode = "Unable to encode object into data"
        case noValue = "No data object found for the given key"
        case unableToDecode = "Unable to decode object into given type"
        
        var errorDescription: String? {
            rawValue
        }
    }
    
    static func setObject<Object>(_ object: Object, forKey: PreferenceName) throws where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
//            set(data, forKey: forKey)
            // Write/Set Data
            UserDefaults.standard.set(data, forKey: forKey.rawValue)
            UserDefaults.standard.synchronize()
        } catch {
            throw ObjectSavableError.unableToEncode
        }
    }
    
    static func getObject<Object>(forKey: PreferenceName, castTo type: Object.Type) throws -> Object where Object: Decodable {
        guard let data = UserDefaults.standard.data(forKey: forKey.rawValue) else { throw ObjectSavableError.noValue }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw ObjectSavableError.unableToDecode
        }
    }
    
    func removeAllPreferences() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    func removeUserPreferences(forKey: PreferenceName) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: forKey.rawValue)
    }
}
