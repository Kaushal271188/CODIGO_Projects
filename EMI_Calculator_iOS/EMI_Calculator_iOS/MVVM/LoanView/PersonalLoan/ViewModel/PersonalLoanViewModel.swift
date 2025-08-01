//
//  PersonalLoanViewModel.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import Foundation

class PersonalLoanViewModel {
    
//    var model: PersonalLoanModel!
    var loanInput: PersonalLoanInput?
    
    init() {
        let todayDate = Date().midnightDate
        let currencySymbol = "\(StaticContents.Constants.Currency) "
        
        self.loanInput = PersonalLoanInput(amount: "0.0",
                                           startDate: todayDate.dateInString,
                                           tenure: "0",
                                           interestRate: "0",
                                           totalInterestPayment: "\(currencySymbol)0",
                                           totalPayback: "\(currencySymbol)0",
                                           emiPayment: "\(currencySymbol)0",
                                           payOffDate: "0.0")
    }
    
    var loanOutput: PersonalLoanOutput? {
        self.calculateEMI(loanInput: self.loanInput)
    }
    
    var startDate: String {
        return Date.shared.getString(fromDate: self.loanInput?.startDate)
    }
    
    /*func calculateEMI(completionHandler: @escaping(_ isSuccess: Bool) -> Void) {
        
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
//        self.model.emiPayment = "\(currency) \(emiPayment.rounded(toPlaces: 2))"
//        self.model.totalPayback = "\(currency) \((emiPayment * Double(tenureInMonths)).rounded(toPlaces: 2))"
//        self.model.totalInterestPayment = "\(currency) \((Double((emiPayment * Double(tenureInMonths))) - principal).rounded(toPlaces: 2))"
////        self.model.totalPayback = "\(currency) \(Double((emiPayment * Double(tenureInMonths))) - principal)"
        
        
        
        let selectedCurrencyInfo: CurrencyListModel? = {
            do {
                let currentInfo = try UserPreference.getObject(forKey: .SelectedCurrencyInfo,
                                                                       castTo: CurrencyListModel.self)
                return currentInfo
            } catch {
                print("1.1 : Error while trying to get default selected country")
                return nil
            }
        }()
        
//        self.model.amount = "\(principal.rounded(toPlaces: 2))"
        
        self.model.amount = {
           if let selectedCurrencyInfo = selectedCurrencyInfo {
               return CurrencyFormatter.shared.format(amount: principal.rounded(toPlaces: 2),
                                                      currencyCode: selectedCurrencyInfo.currency.code)
           }else {
               return "\(currency) \(principal.rounded(toPlaces: 2))"
           }
       }()
        
        self.model.emiPayment = {
            if let selectedCurrencyInfo = selectedCurrencyInfo {
                return CurrencyFormatter.shared.format(amount: emiPayment.rounded(toPlaces: 2),
                                                       currencyCode: selectedCurrencyInfo.currency.code)
            }else {
                return "\(currency) \(emiPayment.rounded(toPlaces: 2))"
            }
        }()
        
        
        self.model.totalPayback = {
            if let selectedCurrencyInfo = selectedCurrencyInfo {
                return CurrencyFormatter.shared.format(amount: ((emiPayment * Double(tenureInMonths)).rounded(toPlaces: 2)),
                                                       currencyCode: selectedCurrencyInfo.currency.code)
            }else {
                return "\(currency) \((emiPayment * Double(tenureInMonths)).rounded(toPlaces: 2))"
            }
        }()
        
        self.model.totalInterestPayment = {
            if let selectedCurrencyInfo = selectedCurrencyInfo {
                return CurrencyFormatter.shared.format(amount: (Double((emiPayment * Double(tenureInMonths))) - principal).rounded(toPlaces: 2),
                                                       currencyCode: selectedCurrencyInfo.currency.code)
            }else {
                return "\(currency) \((Double((emiPayment * Double(tenureInMonths))) - principal).rounded(toPlaces: 2))"
            }
        }()
        
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.1) {
            completionHandler(true)
        }
        
    }*/
    
    private func calculateEMI(loanInput: PersonalLoanInput?) -> PersonalLoanOutput? {
        
        guard var model = loanInput else {
            return nil
        }
        
        guard let principal = Double(model.amount) else {
            return nil
        }
        
        guard let annualInterestRate = Double(model.interestRate) else {
            return nil
        }
        
        guard let tenureInMonths = Int(model.tenure) else {
            return nil
        }
        
        model.amount = "\(principal.rounded(toPlaces: 2))"
        
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
//        self.model.emiPayment = "\(currency) \(emiPayment.rounded(toPlaces: 2))"
//        self.model.totalPayback = "\(currency) \((emiPayment * Double(tenureInMonths)).rounded(toPlaces: 2))"
//        self.model.totalInterestPayment = "\(currency) \((Double((emiPayment * Double(tenureInMonths))) - principal).rounded(toPlaces: 2))"
////        self.model.totalPayback = "\(currency) \(Double((emiPayment * Double(tenureInMonths))) - principal)"
        
        
        
        let selectedCurrencyInfo: CurrencyListModel? = {
            do {
                let currentInfo = try UserPreference.getObject(forKey: .SelectedCurrencyInfo,
                                                                       castTo: CurrencyListModel.self)
                return currentInfo
            } catch {
                print("1.1 : Error while trying to get default selected country")
                return nil
            }
        }()
        
//        self.model.amount = "\(principal.rounded(toPlaces: 2))"
        
        model.amount = {
           if let selectedCurrencyInfo = selectedCurrencyInfo {
               return CurrencyFormatter.shared.format(amount: principal.rounded(toPlaces: 2),
                                                      currencyCode: selectedCurrencyInfo.currency.code)
           }else {
               return "\(currency) \(principal.rounded(toPlaces: 2))"
           }
       }()
        
        model.emiPayment = {
            if let selectedCurrencyInfo = selectedCurrencyInfo {
                return CurrencyFormatter.shared.format(amount: emiPayment.rounded(toPlaces: 2),
                                                       currencyCode: selectedCurrencyInfo.currency.code)
            }else {
                return "\(currency) \(emiPayment.rounded(toPlaces: 2))"
            }
        }()
        
        
        model.totalPayback = {
            if let selectedCurrencyInfo = selectedCurrencyInfo {
                return CurrencyFormatter.shared.format(amount: ((emiPayment * Double(tenureInMonths)).rounded(toPlaces: 2)),
                                                       currencyCode: selectedCurrencyInfo.currency.code)
            }else {
                return "\(currency) \((emiPayment * Double(tenureInMonths)).rounded(toPlaces: 2))"
            }
        }()
        
        model.totalInterestPayment = {
            if let selectedCurrencyInfo = selectedCurrencyInfo {
                return CurrencyFormatter.shared.format(amount: (Double((emiPayment * Double(tenureInMonths))) - principal).rounded(toPlaces: 2),
                                                       currencyCode: selectedCurrencyInfo.currency.code)
            }else {
                return "\(currency) \((Double((emiPayment * Double(tenureInMonths))) - principal).rounded(toPlaces: 2))"
            }
        }()
        
        return PersonalLoanOutput(amount: model.amount,
                                  startDate: model.startDate,
                                  tenure: model.tenure,
                                  interestRate: model.interestRate,
                                  totalInterestPayment: model.totalInterestPayment,
                                  totalPayback: model.totalPayback,
                                  emiPayment: model.emiPayment,
                                  payOffDate: model.payOffDate)
        
        
    }
    
}
