//
//  CustomDouble.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 28/07/25.
//

import Foundation


extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let multiplier = pow(10.0, Double(places))
        return (self * multiplier).rounded() / multiplier
    }
}
