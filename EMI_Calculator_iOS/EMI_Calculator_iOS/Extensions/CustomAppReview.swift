//
//  CustomAppReview.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 31/07/25.
//

import Foundation
import StoreKit

class AppReview {
    
    static func setAppReviews() {

//doesn't guarantee a review prompt every time — Apple decides whether to show it based on frequency and system-level rules.
//        guard let scene = UIApplication.shared.scene else {
//            return
//        }
//        SKStoreReviewController.requestReview(in: scene)
        
        if let url = URL(string: StaticContents.AppConfig.AppStoreURL) {
            UIApplication.shared.open(url)
        }
    }
    
}
