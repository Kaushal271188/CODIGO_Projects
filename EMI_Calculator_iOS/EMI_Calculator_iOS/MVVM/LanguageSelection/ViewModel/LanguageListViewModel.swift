//
//  LanguageListViewModel.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 23/05/25.
//

import Foundation
import UIKit

class LanguageListViewModel {
    
    static let shared = LanguageListViewModel()
    
    enum SupportedLanguages: String {
        case All = "all"
        case Guajarti = "gu"
        case Hindi = "hi"
        case English = "en"
        
        
        static var allKeys: [SupportedLanguages] {
            [.English, .Hindi, .Guajarti]
        }
    }
    
    //Array of country language list
    var languageList: [LanguageListModel]? {
        self.getLanguageList()
    }
    
    var selectedLanguage: LanguageListModel? {
        self.currentLanguage()
    }
    
    var isLanguageSelected: Bool {
        self.checkLanguageSelectionSatatus()
    }
    
    init() {
        
    }
    
    private func currentLanguage() -> LanguageListModel? {
        var selectedLanguage: LanguageListModel? = {
            do {
                let currentLanguageInfo = try UserPreference.getObject(forKey: .SelectedLanguageInfo,
                                                                       castTo: LanguageListModel.self)
                return currentLanguageInfo
            } catch {
                print("1.1 : Error while trying to get default selected country")
                return nil
            }
        }()
        
        guard selectedLanguage == nil else {
            return selectedLanguage
        }
        
        let currentLanguageCode = Locale.current.languageCode
//        selectedLanguage = self.languageList?.first(where: {$0.key.lowercased() == currentCountryCode?.lowercased()})
        
        if let countryCode = currentLanguageCode?.lowercased() {
            if let tempObj = self.languageList?.first(where: {$0.code.lowercased() == countryCode}) {
                selectedLanguage = tempObj
            }
        }
        
        return selectedLanguage
    }
    
    private func checkLanguageSelectionSatatus() -> Bool {
        
        do {
            let _ = try UserPreference.getObject(forKey: .SelectedLanguageInfo,
                                                                   castTo: LanguageListModel.self)
            return true
        } catch {
            print("1.1 : Error while trying to get default selected country")
            return false
        }
    }
    
    private func getLanguageList() -> [LanguageListModel]? {
        guard let url = Bundle.main.url(forResource: StaticContents.FileName.LanguageList, withExtension: StaticContents.FileExtension.JSON) else {
            print("Failed to locate countries.json in bundle.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            var languages = try decoder.decode(Language.self, from: data)
            
            let sortedArrayOfLanguages = languages.language
                .sorted { $0.value.name < $1.value.name } // First, sort by name
                .enumerated()
                .map { index, element in
                    LanguageListModel(
                        indexNumber: index,
                        code: element.key,
                        name: element.value.name,
                        nativeName: element.value.nativeName
                    )
                }
            
            if let obj = languages.language.first {
                print("\(obj.key) : \(obj.value.name) & \(obj.value.nativeName)")
            }
            
            let keys = SupportedLanguages.allKeys.map({$0.rawValue})
            var arrayOfLanguages = [LanguageListModel]()
            
            for i in 0..<keys.count {
                let tempKey = keys[i]
                if var obj = sortedArrayOfLanguages.first(where: {$0.code.lowercased() == tempKey.lowercased()}) {
                    obj.indexNumber = i
                    arrayOfLanguages.append(obj)
                }
            }
            
            return arrayOfLanguages
        } catch {
            print("Error loading or decoding countries.json: \(error)")
            return nil
        }
    }
    
    func saveLanguageInfo(selectedLanguage: LanguageListModel?,
                          isSelected: Bool = true) {
        
        guard var selectedLanguage = selectedLanguage else {
            return
        }
        
        do {
            try UserPreference.setObject(selectedLanguage, forKey: .SelectedLanguageInfo)
            
            Localizable.shared.setLanguage(languageCode: selectedLanguage.code)
            
        } catch {
            print("1.2 : Error while trying to get default selected country")
        }
        
        do {
            let currentLanguageInfo = try UserPreference.getObject(forKey: .SelectedLanguageInfo,
                                                                   castTo: LanguageListModel.self)
            print("JSON of selected Language Name: \(currentLanguageInfo.name)")
            print("JSON of selected Language is Selected: \(currentLanguageInfo.code)")
        } catch {
            print("1.2 : Error while trying to get default selected country")
        }
    }
    
}
