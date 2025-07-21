//
//  TimeZoneExchangeModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 14/07/25.
//

import Foundation


struct TimeZoneExchangeModel {
    
    var selectedDate = Date()
    
    let currentTimeZone = TimeZone.CurrentTimeZone
    let utcTimeZone = TimeZone.UTCTimeZone
    
    var fromTimeZone: TimeZone? = nil
    var toTimeZone: TimeZone? = nil
    
}
