//
//  IntroductionViewModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 13/07/25.
//

import Foundation
import UIKit

class IntroductionViewModel {
    
    var arrayOfIntroductionInfo: [IntroductionInfoModel] {
        self.getIntroductionInfoModel()
    }
    
    private func getIntroductionInfoModel() -> [IntroductionInfoModel] {
        
        var arrayOfOptions = [IntroductionInfoModel]()
        
        var title = StaticContents.Constants.IntroPage1Title
        var desc = StaticContents.Constants.IntroPage1Description
        var img = UIImage.getCustomImage(image: .IntroPage1)
        arrayOfOptions.append(IntroductionInfoModel(titleOfIntro: title, descriptionOfIntro: desc, imgOfIntro: img))
        
        title = StaticContents.Constants.IntroPage2Title
        desc = StaticContents.Constants.IntroPage2Description
        img = UIImage.getCustomImage(image: .IntroPage2)
        arrayOfOptions.append(IntroductionInfoModel(titleOfIntro: title, descriptionOfIntro: desc, imgOfIntro: img))
        
        title = StaticContents.Constants.IntroPage3Title
        desc = StaticContents.Constants.IntroPage3Description
        img = UIImage.getCustomImage(image: .IntroPage3)
        arrayOfOptions.append(IntroductionInfoModel(titleOfIntro: title, descriptionOfIntro: desc, imgOfIntro: img))
        
        title = StaticContents.Constants.IntroPage4Title
        desc = StaticContents.Constants.IntroPage4Description
        img = UIImage.getCustomImage(image: .IntroPage4)
        arrayOfOptions.append(IntroductionInfoModel(titleOfIntro: title, descriptionOfIntro: desc, imgOfIntro: img))
        
        return arrayOfOptions
        
    }
    
}
