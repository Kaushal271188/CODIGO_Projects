//
//  DashboardViewModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 11/07/25.
//

import Foundation

class DashboardViewModel {
    
    var arrayOfOptions: [DashboardModel] {
        self.getDashboardOptions()
    }
    
    
    private func getDashboardOptions() -> [DashboardModel] {
        
        var arrayOfOptions = [DashboardModel]()
        
        /*var sectionTitle = StaticContents.Constants.RemoveAds
        var icon = UIImage.getSystemImage(image: .RemoveAds)
        
        
        sectionTitle = StaticContents.Constants.RemoveAds
        icon = UIImage.getSystemImage(image: .RemoveAds)
        arrayOfOptions.append(LeftMenuModel(optionTitle: sectionTitle, optionIcon: icon))
        
        sectionTitle = StaticContents.Constants.AboutUs
        icon = UIImage.getSystemImage(image: .AboutUs)
        arrayOfOptions.append(LeftMenuModel(optionTitle: sectionTitle, optionIcon: icon))
        
        
        sectionTitle = StaticContents.Constants.RateUs
        icon = UIImage.getSystemImage(image: .RateUs)
        arrayOfOptions.append(LeftMenuModel(optionTitle: sectionTitle, optionIcon: icon))
        
        
        sectionTitle = StaticContents.Constants.Share
        icon = UIImage.getSystemImage(image: .Share)
        arrayOfOptions.append(LeftMenuModel(optionTitle: sectionTitle, optionIcon: icon))*/
        
        
        return arrayOfOptions
        
    }
    
}
