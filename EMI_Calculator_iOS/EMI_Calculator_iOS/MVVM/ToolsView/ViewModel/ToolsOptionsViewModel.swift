//
//  ToolsOptionsViewModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 14/07/25.
//

import Foundation
import UIKit

class ToolsOptionsViewModel {
    
    var arrayOfOptions: [ToolsOptionsModel] {
        self.getOptions()
    }
    
    
    private func getOptions() -> [ToolsOptionsModel] {
        
        var arrayOfOptions = [ToolsOptionsModel]()
        
        var title = StaticContents.Constants.CurrencyExchangeTitle
        var desc = StaticContents.Constants.CurrencyExchangeDescripion
        arrayOfOptions.append(ToolsOptionsModel(optionTitle: title, optionDescription: desc))
        
        title = StaticContents.Constants.TimezoneExchangeTitle
        desc = StaticContents.Constants.TimezoneExchangeDesciption
        arrayOfOptions.append(ToolsOptionsModel(optionTitle: title, optionDescription: desc))
        
        title = StaticContents.Constants.GSTCalculatorTitle
        desc = StaticContents.Constants.GSTCalculatorDescripion
        arrayOfOptions.append(ToolsOptionsModel(optionTitle: title, optionDescription: desc))
        
        
        title = StaticContents.Constants.VATCalculatorTitle
        desc = StaticContents.Constants.VATCalculatorDescripion
        arrayOfOptions.append(ToolsOptionsModel(optionTitle: title, optionDescription: desc))
        
        title = StaticContents.Constants.InflationCalculatorTitle
        desc = StaticContents.Constants.InflationCalculatorDescripion
        arrayOfOptions.append(ToolsOptionsModel(optionTitle: title, optionDescription: desc))
        
        title = StaticContents.Constants.DiscountCalculatorTitle
        desc = StaticContents.Constants.DiscountCalculatorDescripion
        arrayOfOptions.append(ToolsOptionsModel(optionTitle: title, optionDescription: desc))
        
        title = StaticContents.Constants.PercentageCalculatorTitle
        desc = StaticContents.Constants.PercentageCalculatorDescripion
        arrayOfOptions.append(ToolsOptionsModel(optionTitle: title, optionDescription: desc))
        
        title = StaticContents.Constants.PercentageDefferenceCalculatorTitle
        desc = StaticContents.Constants.PercentageDefferenceCalculatorDescripion
        arrayOfOptions.append(ToolsOptionsModel(optionTitle: title, optionDescription: desc))
        
        title = StaticContents.Constants.PercentageChangeCalculatorTitle
        desc = StaticContents.Constants.PercentageChangeCalculatorDescripion
        arrayOfOptions.append(ToolsOptionsModel(optionTitle: title, optionDescription: desc))
        
        
        return arrayOfOptions
        
    }
    
}
