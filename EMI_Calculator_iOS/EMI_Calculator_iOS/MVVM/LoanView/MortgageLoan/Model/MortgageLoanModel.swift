//
//  MortgageLoanModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 01/08/25.
//

import Foundation

struct MortgageInput {
    let homePrice: Double
    let downPayment: Double
    let loanTenureYears: Int
    let annualInterestRate: Double
    let annualPropertyTax: Double
    let annualPMIRate: Double
    let annualHomeInsurance: Double
    let monthlyHOAFee: Double
}

struct MortgageBreakdown {
    let emi: Double
    let pmi: Double //PMI -> Private Mortgage Insuramce
    let propertyTax: Double
    let insurance: Double
    let hoaFee: Double
    let totalMonthlyPayment: Double
}
