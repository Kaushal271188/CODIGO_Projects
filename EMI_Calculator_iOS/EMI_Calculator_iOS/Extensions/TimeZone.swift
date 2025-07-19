//
//  TimeZone.swift
//  EMI_Calculator_iOS
//
//  Created by Kishan Monpara on 18/07/25.
//

import Foundation

extension TimeZone {
    
    static let CurrentTimeZone: TimeZone = {
        TimeZone.current
    }()
    
    static let UTCTimeZone: TimeZone = {
        TimeZone(identifier: "UTC")
    }() ?? CurrentTimeZone
    
    static func customTimeZone(identifier: String) -> TimeZone {
        TimeZone(identifier: identifier) ?? TimeZone.UTCTimeZone
    }
    
}
