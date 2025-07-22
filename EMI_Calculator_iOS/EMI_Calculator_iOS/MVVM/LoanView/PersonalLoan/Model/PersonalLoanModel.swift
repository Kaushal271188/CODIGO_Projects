//
//  PersonalLoanModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import Foundation

struct PersonalLoanModel {
    var amount: Double = 0.0
    var startDate: Date = Date()
    var tenure: Int = 0
    var interestRate: Double = 0.0
    var emiPayment: String = ""
}
