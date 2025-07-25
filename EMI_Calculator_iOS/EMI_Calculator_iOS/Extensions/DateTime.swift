//
//  DateTime.swift
//  EMI_Calculator_iOS
//
//  Created by Kishan Monpara on 18/07/25.
//

import Foundation

extension Date {
    
    static let shared = Date()
    
    var currentDate: Date {
        return Date()
    }
    
    var midnightDate: Date {
        self.getMidnightDate()
    }
    
    var midnightUTCDate: Date {
        self.getMidnightDate(isUTC: true)
    }
    
    var dateInString: String {
        self.convertDateToString()
    }
    
    func getDate(timeZone: String,
                 selectedDate: Date? = Date()) {
        
    }
    
    private func getMidnightDate(isUTC: Bool = false) -> Date {
        var calendar = Calendar.current
        var midnight = calendar.startOfDay(for: self)
        
        if isUTC == true {
            calendar = Calendar(identifier: .gregorian)
            var utcCalendarWithZone = calendar
            utcCalendarWithZone.timeZone = TimeZone(abbreviation: "UTC")!

            midnight = utcCalendarWithZone.startOfDay(for: self)
        }
        
        return midnight
    }
    
    private func convertDateToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter.string(from: self)
    }
    
    func getString(displayDateFormate: String = "d,MMM-YYYY",
                   fromDate: String? = nil) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = displayDateFormate
        
        if let fromDate = fromDate {
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            if let tempDate = formatter.date(from: fromDate) {
                formatter.dateFormat = displayDateFormate
                return formatter.string(from: tempDate)
            }else {
                return formatter.string(from: self)
            }
        }else {
            return formatter.string(from: self)
        }
    }
    
    func getDate(fromDateFormate: String = "yyyy-MM-dd'T'HH:mm:ssZ",
                 fromDate: String? = nil) -> Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = fromDateFormate
        
        if let fromDate = fromDate {
            if let tempDate = formatter.date(from: fromDate) {
                return tempDate
            }else {
                return self
            }
        }else {
            return self
        }
        
        
    }
    
}
