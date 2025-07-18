//
//  TimeZoneExchangeViewModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 14/07/25.
//

import Foundation
import UIKit
import Foundation

class TimeZoneExchangeViewModel {
    
    var arrayOfTimezone: [String]?
    
    init() {
        self.arrayOfTimezone = TimeZone.knownTimeZoneIdentifiers
    }
    
}
