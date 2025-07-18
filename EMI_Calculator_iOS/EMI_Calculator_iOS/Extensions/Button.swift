//
//  Button.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 25/05/25.
//

import Foundation
import UIKit

extension UIButton {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.setViewFormate()
    }
    
    private func setViewFormate() {
        DispatchQueue.main.async {
            self.layer.cornerRadius = 5.0
        }
        
    }
}
