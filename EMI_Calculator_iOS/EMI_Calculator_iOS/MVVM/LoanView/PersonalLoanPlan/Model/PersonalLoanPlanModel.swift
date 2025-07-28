//
//  PersonalLoanPlanModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 26/07/25.
//

import Foundation

struct PersonalLoanPlanModel: LoanInfo {
    var amount: String
    var startDate: String
    var tenure: String
    var interestRate: String
    var totalInterestPayment: String
    var totalPayback: String
    var emiPayment: String
    var payOffDate: String
}
