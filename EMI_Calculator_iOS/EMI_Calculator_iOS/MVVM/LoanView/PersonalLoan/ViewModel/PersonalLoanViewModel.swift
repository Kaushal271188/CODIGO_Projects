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
        let currencySymbol = "\(StaticContents.Constants.Currency) "
        let model = PersonalLoanModel(startDate: todayDate, emiPayment: "\(currencySymbol)0")
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
    
    func calculateEMI(completionHandler: @escaping(_ isSuccess: Bool) -> Void) {
        
        let principal = self.model.amount
        let annualInterestRate = self.model.interestRate
        let tenureInMonths = self.model.tenure
        
        
        let monthlyInterestRate = annualInterestRate / 12 / 100

        self.model.emiPayment = {
            
            let currencySymbol = "\(StaticContents.Constants.Currency) "
            
            if monthlyInterestRate == 0 {
                // No interest case
                completionHandler(true)
                return "\(currencySymbol)\(principal / Double(tenureInMonths))"
                
            }
            
            let numerator = principal * monthlyInterestRate * pow(1 + monthlyInterestRate, Double(tenureInMonths))
            let denominator = pow(1 + monthlyInterestRate, Double(tenureInMonths)) - 1
            
            let emi = numerator / denominator
            
            completionHandler(true)
            return "\(currencySymbol) \(emi)"
            
        }()
    }
    
}
