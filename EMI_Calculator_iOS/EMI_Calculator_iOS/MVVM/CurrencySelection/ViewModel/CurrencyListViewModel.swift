//
//  CurrencyListViewModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 09/07/25.
//

import Foundation
import UIKit

class CurrencyListViewModel {
    
    static let shared = CurrencyListViewModel()
    
    //Array of country language list
    var arrayOfCurrenyList: [CurrencyListModel]? {
        self.getCurrencyList()
    }
    
    var selectedCurrency: CurrencyListModel? {
        self.currentCurrency()
    }
    
    var isCurrencySelected: Bool {
        self.checkCurrencySelectionSatatus()
    }
    
    init() {
        
    }
    
    private func currentCurrency() -> CurrencyListModel? {
        var selectedInfo: CurrencyListModel? = {
            do {
                let currentInfo = try UserPreference.getObject(forKey: .SelectedCurrencyInfo,
                                                                       castTo: CurrencyListModel.self)
                return currentInfo
            } catch {
                print("1.1 : Error while trying to get default selected country")
                return nil
            }
        }()
        
        guard selectedInfo == nil else {
            return selectedInfo
        }
        
        let currentCountryCode = Locale.current.regionCode
        selectedInfo = self.arrayOfCurrenyList?.first(where: {$0.code.lowercased() == currentCountryCode?.lowercased()})
        
        return selectedInfo
    }
    
    private func checkCurrencySelectionSatatus() -> Bool {
        
        do {
            let _ = try UserPreference.getObject(forKey: .SelectedCurrencyInfo,
                                                                   castTo: CurrencyListModel.self)
            return true
        } catch {
            print("1.1 : Error while trying to get default selected country")
            return false
        }
    }
    
    private func getCurrencyList() -> [CurrencyListModel]? {
        guard let url = Bundle.main.url(forResource: StaticContents.FileName.CountriesWithLanguage, withExtension: StaticContents.FileExtension.JSON) else {
            print("Failed to locate countries.json in bundle.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let countries = try decoder.decode([CurrencyListModel].self, from: data)
            
            // Dictionary to get unique values based on currencyCode
            let uniqueByCurrency = Dictionary(grouping: countries, by: { $0.currency.code })
                .compactMapValues { $0.first } // or use `.last` to keep the last one

            // If you want an array:
            var uniqueCurrencyList = Array(uniqueByCurrency.values)
            uniqueCurrencyList = uniqueCurrencyList.filter({(($0.currency.symbol?.count ?? 0) > 0 && $0.currency.symbol != " ")})
            return uniqueCurrencyList
        } catch {
            print("Error loading or decoding countries.json: \(error)")
            return nil
        }
    }
    
    func saveCurrencyInfo(selectedCurrency: CurrencyListModel?,
                          isSelected: Bool = true) {
        
        guard var selectedCurrency = selectedCurrency else {
            return
        }
        
        selectedCurrency.currency.symbol = selectedCurrency.currency.symbol == nil ? "" : selectedCurrency.currency.symbol
        selectedCurrency.language.code = selectedCurrency.language.code == nil ? "" : selectedCurrency.language.code
        
        do {
            try UserPreference.setObject(selectedCurrency, forKey: .SelectedCurrencyInfo)
        } catch {
            print("1.2 : Error while trying to get default selected country")
        }
        
        do {
            let currentLanguageInfo = try UserPreference.getObject(forKey: .SelectedCurrencyInfo,
                                                                   castTo: CurrencyListModel.self)
            print("JSON of selected Language Name: \(currentLanguageInfo.name)")
//            print("JSON of selected Language is Selected: \(currentLanguageInfo.selected)")
        } catch {
            print("1.2 : Error while trying to get default selected country")
        }
    }
    
}
