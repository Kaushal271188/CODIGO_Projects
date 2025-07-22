//
//  PersonalLoanViewModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import Foundation

class PersonalLoanViewModel {
    
    var model: PersonalLoanModel!
    
    init() {
        let todayDate = Date()
        var model = PersonalLoanModel(amount: nil,
                                      startDate: todayDate,
                                      tenure: nil,
                                      interestRate: nil)
        self.model = model
    }
    
    var startDate: String {
        self.getStartDateValue()
    }
    
    private func getStartDateValue() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d,MMM-YYYY"
        dateFormatter.timeZone = TimeZone.CurrentTimeZone
        return dateFormatter.string(from: self.model.startDate)
    }
    
}
