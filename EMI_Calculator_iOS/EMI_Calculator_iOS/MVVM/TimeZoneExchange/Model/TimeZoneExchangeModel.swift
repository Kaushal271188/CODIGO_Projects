//
//  TimeZoneExchangeModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 14/07/25.
//

import Foundation


struct TimeZoneExchangeModel {
    
//    var currentTimeZone: TimeZone.locale?
//    var selectedFromTimeZone: String?
//    var selectedToTimeZone: String?
    
//    var selectedDate: Date?
//    var selectedTime: Date?
//    
//    var resultDate: Date?
//    var resultTime: Date?
    
    
    var selectedDate = Date()
    let selectedTimeZone = TimeZone.UTCTimeZone
    
    var fromTimeZone: TimeZone? = nil
    var toTImeZonw: TimeZone? = nil
    
}
