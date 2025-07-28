//
//  PersonalLoanViewModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import Foundation

class PersonalLoanViewModel {
    
//    var model: PersonalLoanModel!
    var model: LoanInfo!
    
    init() {
        let todayDate = Date().midnightDate
        let currencySymbol = "\(StaticContents.Constants.Currency) "
        
        self.model = PersonalLoanModel(amount: "0.0",
                                       startDate: todayDate.dateInString,
                                       tenure: "0",
                                       interestRate: "0",
                                       totalInterestPayment: "\(currencySymbol)0",
                                       totalPayback: "\(currencySymbol)0",
                                       emiPayment: "\(currencySymbol)0",
                                       payOffDate: "0.0")
    }
    
    var startDate: String {
        return Date.shared.getString(fromDate: self.model.startDate)
    }
    
    func calculateEMI(completionHandler: @escaping(_ isSuccess: Bool) -> Void) {
        
        guard let principal = Double(self.model.amount) else {
            completionHandler(false)
            return
        }
        
        guard let annualInterestRate = Double(self.model.interestRate) else {
            completionHandler(false)
            return
        }
        
        guard let tenureInMonths = Int(self.model.tenure) else {
            completionHandler(false)
            return
        }
        
        self.model.amount = "\(principal.rounded(toPlaces: 2))"
        
        let monthlyInterestRate = annualInterestRate / 12 / 100

        //Claculate the EMI Payment.
        var emiPayment: Double = 0.0
        
        if monthlyInterestRate == 0 {
            // No interest case
            emiPayment = (principal / Double(tenureInMonths))
        }else {
            
            let numerator = principal * monthlyInterestRate * pow(1 + monthlyInterestRate, Double(tenureInMonths))
            let denominator = pow(1 + monthlyInterestRate, Double(tenureInMonths)) - 1
            
            let emi = numerator / denominator
            
            emiPayment = emi
        }
        //End
        let currency = "\(StaticContents.Constants.Currency) "
        self.model.emiPayment = "\(currency) \(emiPayment.rounded(toPlaces: 2))"
        self.model.totalPayback = "\(currency) \((emiPayment * Double(tenureInMonths)).rounded(toPlaces: 2))"
        self.model.totalInterestPayment = "\(currency) \((Double((emiPayment * Double(tenureInMonths))) - principal).rounded(toPlaces: 2))"
//        self.model.totalPayback = "\(currency) \(Double((emiPayment * Double(tenureInMonths))) - principal)"
        
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
            completionHandler(true)
        }
        
    }
    
}
