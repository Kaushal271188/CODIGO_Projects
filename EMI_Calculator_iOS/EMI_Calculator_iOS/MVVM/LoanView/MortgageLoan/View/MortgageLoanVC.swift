//
//  MortgageLoanVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 01/08/25.
//

import UIKit

class MortgageLoanVC: UIViewController {

    @IBOutlet weak var txtOfHomePrice: CustomTextField!
    @IBOutlet weak var txtOfDownPayment: CustomTextField!
    @IBOutlet weak var txtOfTenure: CustomTextField!
    @IBOutlet weak var txtOfInterestRate: CustomTextField!
    @IBOutlet weak var txtOfPropertyTaxAmount: CustomTextField!
    @IBOutlet weak var txtOfPMI: CustomTextField!
    @IBOutlet weak var txtOfHomeOwnerInsurance: CustomTextField!
    @IBOutlet weak var txtOfHOAFee: CustomTextField!
    
    var viewModel = MortgageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MortgageLoanVC {
    
    func setViewFormate() {
        
        self.txtOfHomePrice?.textFieldInfo = CustomTextField.CustomTextFieldInfo(title: StaticContents.Constants.HomePriceTitle,
                                                                              placeHolder: StaticContents.Constants.HomePricePlaceholder,
                                                                              textFieldType: .Amount)
        
        self.txtOfDownPayment?.textFieldInfo = CustomTextField.CustomTextFieldInfo(title: StaticContents.Constants.DownPaymentTitle,
                                                                                    placeHolder: StaticContents.Constants.DownPaymentPlaceholder,
                                                                                    textFieldType: .Amount)
        
        self.txtOfTenure?.textFieldInfo = CustomTextField.CustomTextFieldInfo(title: StaticContents.Constants.TenureTitle,
                                                                              placeHolder: StaticContents.Constants.TenurePlaceholder,
                                                                              textFieldType: .Tenure)

        self.txtOfInterestRate?.textFieldInfo = CustomTextField.CustomTextFieldInfo(title: StaticContents.Constants.InterestRateTitle,
                                                                                     placeHolder: StaticContents.Constants.InterestRatePlaceholder,
                                                                                     textFieldType: .Percentage)
        
        self.txtOfPropertyTaxAmount?.textFieldInfo = CustomTextField.CustomTextFieldInfo(title: StaticContents.Constants.PropertyTaxTitle,
                                                                                     placeHolder: StaticContents.Constants.PropertyTaxPlaceholder,
                                                                                     textFieldType: .Amount)
        
        self.txtOfPMI?.textFieldInfo = CustomTextField.CustomTextFieldInfo(title: StaticContents.Constants.PmiTitle,
                                                                                     placeHolder: StaticContents.Constants.PmiPlaceholder,
                                                                                     textFieldType: .Amount)
        
        self.txtOfHomeOwnerInsurance?.textFieldInfo = CustomTextField.CustomTextFieldInfo(title: StaticContents.Constants.HomeownerInsuranceTitle,
                                                                                     placeHolder: StaticContents.Constants.HomeownerInsurancePlaceholder,
                                                                                     textFieldType: .Amount)
        
        self.txtOfHOAFee?.textFieldInfo = CustomTextField.CustomTextFieldInfo(title: StaticContents.Constants.HoaFeeTitle,
                                                                                     placeHolder: StaticContents.Constants.HoaFeePlaceholder,
                                                                                     textFieldType: .Amount)
        
        self.setTextFieldFormate(textField: self.txtOfHomePrice)
        self.setTextFieldFormate(textField: self.txtOfDownPayment)
        self.setTextFieldFormate(textField: self.txtOfTenure)
        self.setTextFieldFormate(textField: self.txtOfInterestRate)
        self.setTextFieldFormate(textField: self.txtOfPropertyTaxAmount)
        self.setTextFieldFormate(textField: self.txtOfPMI)
        self.setTextFieldFormate(textField: self.txtOfHomeOwnerInsurance)
        self.setTextFieldFormate(textField: self.txtOfHOAFee)
        
    }
    
    func setTextFieldFormate(textField: CustomTextField) {
        textField.setViewFormate()
        textField.customTextFieldDelegate = self
    }
    
    func checkValidValue() -> Bool {
        
        self.hideKeyBoard()
        
        var message: String? = nil
        
        if self.txtOfHomePrice?.getText()?.trimmed.count == 0 {
            message = StaticContents.Constants.HomePricePlaceholder
        }else if self.txtOfDownPayment?.getText()?.trimmed.count == 0 {
            message = StaticContents.Constants.DownPaymentPlaceholder
        }else if self.txtOfTenure?.getText()?.trimmed.count == 0 {
            message = StaticContents.Constants.LoanTenureLoanTermTitle
        }else if self.txtOfInterestRate?.getText()?.trimmed.count == 0 {
            message = StaticContents.Constants.InterestRatePlaceholder
        }else if self.txtOfPropertyTaxAmount?.getText()?.trimmed.count == 0 {
            message = StaticContents.Constants.PropertyTaxPlaceholder
        }else if self.txtOfPMI?.getText()?.trimmed.count == 0 {
            message = StaticContents.Constants.PmiPlaceholder
        }else if self.txtOfHomeOwnerInsurance?.getText()?.trimmed.count == 0 {
            message = StaticContents.Constants.HomeownerInsurancePlaceholder
        }else if self.txtOfHOAFee?.getText()?.trimmed.count == 0 {
            message = StaticContents.Constants.HoaFeePlaceholder
        }
        
        if let message = message {
            
            AlertView.showAlertWith(alertMessage: message,
                               buttonArray: [StaticContents.Constants.OK]) { buttonIndex in
                //Do some action here
            }
            
            return false
        }
        
        return true
    }
    
    func hideKeyBoard() {
        DispatchQueue.main.async {
            self.txtOfHomePrice?.lostFocuss()
            self.txtOfDownPayment?.lostFocuss()
            self.txtOfTenure?.lostFocuss()
            self.txtOfInterestRate?.lostFocuss()
            self.txtOfPropertyTaxAmount?.lostFocuss()
            self.txtOfPMI?.lostFocuss()
            self.txtOfHomeOwnerInsurance?.lostFocuss()
            self.txtOfHOAFee?.lostFocuss()
        }
    }
}

extension MortgageLoanVC: CustomTextFieldDelegate {
    func didChangeValue(textField: CustomTextField) {
        
    }
    
    func didGetFocused(textField: CustomTextField) {
        
        self.hideKeyBoard()
        
        if textField == self.txtOfTenure {
            
            let tenureTime = stride(from: 0, through: 360, by: 1).map({"\($0)"})
            let selectedTime = (self.txtOfTenure?.getText()?.count ?? 0) > 0 ? self.txtOfTenure?.getText()?.trimmed : nil
            
            self.showDataPicker(fromSourceView: self.txtOfTenure,
                                items: tenureTime,
                                item: selectedTime) { isSuccess, selectedValue, selectedIndex in
                if let selectedValue = selectedValue {
                    DispatchQueue.main.async {
                        self.txtOfTenure?.setText(selectedValue)
                    }
                }
            }
            
        }
        
    }
    
    func didLostFocused(textField: CustomTextField) {
        if (textField == self.txtOfStartLoanDate ||
            textField == self.txtOfTenure) {
            self.hideKeyBoard()
        }
    }
    
    
    
    
}
