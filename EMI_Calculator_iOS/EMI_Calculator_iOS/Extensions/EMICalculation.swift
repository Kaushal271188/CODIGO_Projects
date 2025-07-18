//
//  EMICalculation.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 04/07/25.
//

import Foundation

/*protocol EMICalculation {
    var principalAmount: Double { get }
    var interestRate: Double { get }
    var tenure: Int { get }
}

extension EMICalculation {
    var principalAmount: Double {
        return 0.0
    }
    
    var interestRate: Double {
        return 0.0
    }
    
    var tenure: Int {
        return 0
    }
}


/*struct EMICalculation {
    
    enum CalculationType: String {
        case Yearly = "Yearly"
        case Monthly = "Monthly"
    }
    
    var calculationType: CalculationType = .Yearly
    
    var principalAmount: Double = 0.0
    var interestRate: Double = 0.0 //in number of months
    var tenure: Double = 0.0 //in number of months
    
    var monthlyEMIAmount: Double = 0.0
    
    //1. Basic EMI
    private mutating func basicEMI() {
//        var duration: Int = self.calculationType == .Yearly ? 12 : 1
//        var emi = self.principalAmount *
    }
}*/

class HomeLoanEMICalculator: EMICalculation {
    
    struct TenureInformation {
        var title: String
        var duration: Int
    }
    
    enum Tenures {
        case Year_5 (TenureInformation)
        case Year_10 (TenureInformation)
        case Year_15 (TenureInformation)
        case Year_20 (TenureInformation)
        case Year_25 (TenureInformation)
        case Year_30 (TenureInformation)
    }
    
    var minTenure: Double = 60 //In months 12 * 5 = 60
    var maxTenure: Double = 360 //In months 12 * 30 = 360
    let tenures = [TenureInformation]()
    var currentTenure: [Tenures] = [
        Tenures.Year_5 (TenureInformation(title: "5 Years", duration: 5)),
        Tenures.Year_10 (TenureInformation(title: "10 Years", duration: 10)),
        Tenures.Year_15 (TenureInformation(title: "15 Years", duration: 15)),
        Tenures.Year_20 (TenureInformation(title: "20 Years", duration: 20)),
        Tenures.Year_25 (TenureInformation(title: "25 Years", duration: 25)),
        Tenures.Year_30 (TenureInformation(title: "30 Years", duration: 30))
    ]
}*/

@propertyWrapper
struct ValidDoubleInput {
    private(set) var value: Double?
    private(set) var error: String?
    
    private let allowsNegative: Bool
    private let label: String

    var wrappedValue: String {
        didSet {
            validate()
        }
    }

    var projectedValue: (value: Double?, error: String?) {
        (value, error)
    }

    init(wrappedValue: String, label: String, allowsNegative: Bool = false) {
        self.label = label
        self.allowsNegative = allowsNegative
        self.wrappedValue = wrappedValue
        validate()
    }

    private mutating func validate() {
        if wrappedValue.isEmpty {
            value = nil
            error = "\(label) is required."
            return
        }

        guard let doubleVal = Double(wrappedValue) else {
            value = nil
            error = "\(label) must be a valid number."
            return
        }

        if !doubleVal.isFinite || doubleVal.isNaN {
            value = nil
            error = "\(label) is not a valid value."
            return
        }

        if !allowsNegative && doubleVal < 0 {
            value = nil
            error = "\(label) cannot be negative."
            return
        }

        value = doubleVal
        error = nil
    }
}

struct EMICalculation {
    
    var loanAmount: String = ""
    var interestRate: String = ""
    var tenure: String = ""
    var tenureInYears: Bool = true
    
    private var emi: Double {
        let P = Double(loanAmount) ?? 0
        let annualRate = Double(interestRate) ?? 0
        let N = Double(tenure) ?? 0
        let R = annualRate / 12 / 100
        let months = tenureInYears ? N * 12 : N
        
        guard P > 0, R > 0, months > 0 else { return 0 }
        
        let numerator = P * R * pow(1 + R, months)
        let denominator = pow(1 + R, months) - 1
        return numerator / denominator
    }
    
    private var totalPayment: Double {
        emi * (Double(tenureInYears ? (Double(tenure) ?? 0) * 12 : Double(tenure) ?? 0))
    }
    
    private var totalInterest: Double {
        totalPayment - (Double(loanAmount) ?? 0)
    }
    
    func EMICalculationResult(emiData: EMICalculation,
                              completionHandler: @escaping(_ emi: Double?,
                                                           _ totalPayment: Double?,
                                                           _ totalInterest: Double?,
                                                           _ errorMessage: String?) -> Void) {
        
    }
    
    
    
}
