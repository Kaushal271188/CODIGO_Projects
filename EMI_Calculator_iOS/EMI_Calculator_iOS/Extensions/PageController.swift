//
//  PageController.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 13/07/25.
//

import Foundation
import UIKit

extension UIPageControl {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.setViewFormate()
    }
    
    private func setViewFormate() {
        self.hidesForSinglePage = true
    }
    
}
