//
//  DashboardViewModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 11/07/25.
//

import Foundation
import UIKit

class DashboardViewModel {
    
    var arrayOfOptions = [DashboardModel]()
    
    
    init() {
        self.arrayOfOptions = self.getDashboardOptions()
    }
    
    
    private func getDashboardOptions() -> [DashboardModel] {
        
        var arrayOfOptions = [DashboardModel]()
        
        var optionTitle = StaticContents.Constants.PersonalLoanTitle
        var icon = UIImage.getSystemImage(image: .RemoveAds)
        arrayOfOptions.append(DashboardModel(optionTitle: optionTitle, optionIcon: icon))
        
        optionTitle = StaticContents.Constants.MortgageLocanTitle
        arrayOfOptions.append(DashboardModel(optionTitle: optionTitle, optionIcon: icon))
        
        optionTitle = StaticContents.Constants.CarLoanTitle
        arrayOfOptions.append(DashboardModel(optionTitle: optionTitle, optionIcon: icon))
        
        optionTitle = StaticContents.Constants.BusinessLoanTitle
        arrayOfOptions.append(DashboardModel(optionTitle: optionTitle, optionIcon: icon))
        
        optionTitle = StaticContents.Constants.AIVisionCashCounterTitle
        arrayOfOptions.append(DashboardModel(optionTitle: optionTitle, optionIcon: icon))
        
        optionTitle = StaticContents.Constants.FixedDepositTitle
        arrayOfOptions.append(DashboardModel(optionTitle: optionTitle, optionIcon: icon))
        
        optionTitle = StaticContents.Constants.RecurringDepositTitle
        arrayOfOptions.append(DashboardModel(optionTitle: optionTitle, optionIcon: icon))
        
        optionTitle = StaticContents.Constants.SIPCalculatorTitle
        arrayOfOptions.append(DashboardModel(optionTitle: optionTitle, optionIcon: icon))
        
        optionTitle = StaticContents.Constants.SimpleInterestTitle
        arrayOfOptions.append(DashboardModel(optionTitle: optionTitle, optionIcon: icon))
        
        optionTitle = StaticContents.Constants.PublicProvidentFundTitle
        arrayOfOptions.append(DashboardModel(optionTitle: optionTitle, optionIcon: icon))
        
        optionTitle = StaticContents.Constants.PostOfficeMISCalculatorTitle
        arrayOfOptions.append(DashboardModel(optionTitle: optionTitle, optionIcon: icon))
        
        return arrayOfOptions
        
    }
    
}
