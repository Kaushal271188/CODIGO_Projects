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
    
    enum TimeZoneType: String {
        case FromDate = "FromDate"
        case FromTime = "FromTime"
        case ToDate = "ToDate"
        case ToTime = "ToTime"
    }
    
    var selectedDate = Date()
    
    var timeZoneModel = TimeZoneExchangeModel()
    
    var arrayOfTimezone: [String]?
    
    var fromDate: String? {
        return self.getResult(timeZoneType: .FromDate)
    }
    
    var fromTime: String? {
        return self.getResult(timeZoneType: .FromTime)
    }
    
    var toDate: String? {
        return self.getResult(timeZoneType: .ToDate)
    }
    
    var toTime: String? {
        return self.getResult(timeZoneType: .ToTime)
    }
    
    init() {
        self.arrayOfTimezone = TimeZone.knownTimeZoneIdentifiers
    }
    
    private func getResult(timeZoneType: TimeZoneType) -> String? {
        
        var finalResult: String? = nil
        
        let dateFormatter = DateFormatter()
        
        let utcDate = self.getNewDate(fromDate: self.timeZoneModel.selectedDate,
                                      timeZone: TimeZone.UTCTimeZone)
        var finalTimeZone: TimeZone? = nil
    
        switch timeZoneType {
            case .FromDate:
                if let timeZone = self.timeZoneModel.fromTimeZone {
                    dateFormatter.dateFormat = "d,MMM-YYYY"
                    finalTimeZone = timeZone
                }
            case .FromTime:
                if let timeZone = self.timeZoneModel.fromTimeZone {
                    dateFormatter.dateFormat = "HH:mm"
                    finalTimeZone = timeZone
                }
            case .ToDate:
                if let timeZone = self.timeZoneModel.toTimeZone {
                    dateFormatter.dateFormat = "d,MMM-YYYY"
                    finalTimeZone = timeZone
                }
            case .ToTime:
                if let timeZone = self.timeZoneModel.toTimeZone {
                    dateFormatter.dateFormat = "HH:mm"
                    finalTimeZone = timeZone
                }
        }
        if let timeZone = finalTimeZone {
            finalResult = dateFormatter.string(from: self.getNewDate(fromDate: utcDate,
                                                                     timeZone: timeZone))
        }
        
        return finalResult
        
    }
    
    private func getNewDate(fromDate: Date,
                            timeZone: TimeZone) -> Date {
        // Create a DateFormatter
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        // Set the desired time zone using its identifier (e.g., "Asia/Kolkata", "UTC", "America/New_York")
        formatter.timeZone =  timeZone
        
        var finalDate = fromDate
        let stringDate = formatter.string(from: finalDate)
        
        finalDate = formatter.date(from: stringDate)!
        
        return finalDate
    }
    
}
