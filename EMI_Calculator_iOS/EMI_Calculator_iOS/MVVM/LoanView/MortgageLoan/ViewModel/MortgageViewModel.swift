//
//  MortgageViewModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 01/08/25.
//

import Foundation

class MortgageViewModel {
    
    var loanInput: MortgageInput?
    
    var loanOutput: MortgageBreakdown? {
        self.calculateEMI(input: self.loanInput)
    }
    
    
    private func calculateEMI(input: MortgageInput?) -> MortgageBreakdown? {
        
        guard let input = input else {
            return nil
        }
        
        let loanAmount = input.homePrice - input.downPayment
        let monthlyInterestRate = input.annualInterestRate / 12 / 100
        let numberOfPayments = Double(input.loanTenureYears * 12)
        
        // EMI Calculation
        let numerator = loanAmount * monthlyInterestRate * pow(1 + monthlyInterestRate, numberOfPayments)
        let denominator = pow(1 + monthlyInterestRate, numberOfPayments) - 1
        let emi = denominator == 0 ? 0 : numerator / denominator
        
        // PMI -> Private Mortgage Insuramce
        // PMI Monthly
        let pmi = (loanAmount * input.annualPMIRate) / 12
        
        // Property Tax Monthly
        let propertyTax = input.annualPropertyTax / 12
        
        // Home Insurance Monthly
        let insurance = input.annualHomeInsurance / 12
        
        // HOA Monthly
        let hoaFee = input.monthlyHOAFee
        
        // Total Payment
        let totalPayment = emi + pmi + propertyTax + insurance + hoaFee
        
        return MortgageBreakdown(emi: emi,
                                 pmi: pmi,
                                 propertyTax: propertyTax,
                                 insurance: insurance,
                                 hoaFee: hoaFee,
                                 totalMonthlyPayment: totalPayment)
    }
}
