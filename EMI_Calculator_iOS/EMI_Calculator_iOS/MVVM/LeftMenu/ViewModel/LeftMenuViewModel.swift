//
//  LeftMenuViewModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 10/07/25.
//

import Foundation
import UIKit

class LeftMenuViewModel {
    
    var arrayOfOptions: [LeftMenuModel] {
        self.getLeftOptions()
    }
    
    
    private func getLeftOptions() -> [LeftMenuModel] {
        
        var arrayOfOptions = [LeftMenuModel]()
        
        var title = StaticContents.Constants.RemoveAds
        var icon = UIImage.getSystemImage(image: .RemoveAds)
        
        
        title = StaticContents.Constants.RemoveAds
        icon = UIImage.getSystemImage(image: .RemoveAds)
        arrayOfOptions.append(LeftMenuModel(optionTitle: title, optionIcon: icon))
        
        title = StaticContents.Constants.AboutUs
        icon = UIImage.getSystemImage(image: .AboutUs)
        arrayOfOptions.append(LeftMenuModel(optionTitle: title, optionIcon: icon))
        
        
        title = StaticContents.Constants.RateUs
        icon = UIImage.getSystemImage(image: .RateUs)
        arrayOfOptions.append(LeftMenuModel(optionTitle: title, optionIcon: icon))
        
        
        title = StaticContents.Constants.Share
        icon = UIImage.getSystemImage(image: .Share)
        arrayOfOptions.append(LeftMenuModel(optionTitle: title, optionIcon: icon))
        
        
        return arrayOfOptions
        
    }
    
}
