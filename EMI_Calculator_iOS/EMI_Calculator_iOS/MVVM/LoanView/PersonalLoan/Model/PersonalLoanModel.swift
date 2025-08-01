//
//  PersonalLoanModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import Foundation

protocol LoanInfo {
    var amount: String { get set }
    var startDate: String { get set }
    var tenure: String { get set }
    var interestRate: String { get set }
    
    
    var totalInterestPayment: String { get set }
    var totalPayback: String { get set }
    var emiPayment: String { get set }
    var payOffDate: String { get set }
}

struct PersonalLoanInput: LoanInfo {
    var amount: String
    var startDate: String
    var tenure: String
    var interestRate: String
    var totalInterestPayment: String
    var totalPayback: String
    var emiPayment: String
    var payOffDate: String
}

struct PersonalLoanOutput: LoanInfo {
    var amount: String
    var startDate: String
    var tenure: String
    var interestRate: String
    var totalInterestPayment: String
    var totalPayback: String
    var emiPayment: String
    var payOffDate: String
}

