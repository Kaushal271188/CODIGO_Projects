//
//  ScrollView.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 26/06/25.
//

import Foundation
import UIKit

protocol CustomScrollViewDelegate {
    var didGetHeaderAlpha: ((_: CGFloat) -> Void)? {get set}
}


extension UIScrollView {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
    }
    
}
