//
//  PersonalLoanModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import Foundation

struct PersonalLoanModel {
    var amount: String = "0.0"
    var startDate: String = ""
    var tenure: String = "0"
    var interestRate: String = "0.0"
    
    
    var totalInterestPayment: String = "0.0"
    var totalPayback: String = "0.0"
    var emiPayment: String = "0.0"
    var payOffDate: String = ""
}
