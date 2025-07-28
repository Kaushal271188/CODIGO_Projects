//
//  PersonalLoanVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import UIKit

class PersonalLoanVC: UIViewController {

    @IBOutlet weak var txtOfAmount: CustomTextField!
    @IBOutlet weak var txtOfInterestRate: CustomTextField!
    @IBOutlet weak var txtOfTenure: CustomTextField!
    @IBOutlet weak var txtOfStartLoanDate: CustomTextField!
    
    @IBOutlet weak var btnOfGetResult: UIButton!
    
    var viewModel = PersonalLoanViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setViewFormate()
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

extension PersonalLoanVC {
    
    func setViewFormate() {
        
        self.txtOfAmount?.textFieldInfo = CustomTextField.CustomTextFieldInfo(title: StaticContents.Constants.AmountTitle,
                                                                              placeHolder: StaticContents.Constants.AmountPlaceHolder,
                                                                              textFieldType: .Amount)
        
        self.txtOfInterestRate?.textFieldInfo = CustomTextField.CustomTextFieldInfo(title: StaticContents.Constants.InterestRateTitle,
                                                                                    placeHolder: StaticContents.Constants.InterestRatePlaceHolder,
                                                                                    textFieldType: .Percentage)
        
        self.txtOfTenure?.textFieldInfo = CustomTextField.CustomTextFieldInfo(title: StaticContents.Constants.TenureTitle,
                                                                              placeHolder: StaticContents.Constants.TenurePlaceHolder,
                                                                              textFieldType: .Tenure)
        
        self.txtOfStartLoanDate?.textFieldInfo = CustomTextField.CustomTextFieldInfo(title: StaticContents.Constants.StartDateTitle,
                                                                                     placeHolder: StaticContents.Constants.StartDatePlaceHolder,
                                                                                     textFieldType: .Date)
        
        self.setTextFieldFormate(textField: self.txtOfAmount)
        self.setTextFieldFormate(textField: self.txtOfInterestRate)
        self.setTextFieldFormate(textField: self.txtOfTenure)
        self.setTextFieldFormate(textField: self.txtOfStartLoanDate)
        
        self.txtOfStartLoanDate?.setText(self.viewModel.startDate)
        
    }
    
    func setTextFieldFormate(textField: CustomTextField) {
        textField.setViewFormate()
        textField.customTextFieldDelegate = self
    }
    
    func hideKeyBoard() {
        DispatchQueue.main.async {
            self.txtOfAmount?.lossFocuss()
//            self.txtOfTenure?.textField.resignFirstResponder()
            self.txtOfInterestRate?.lossFocuss()
//            self.txtOfStartLoanDate?.textField.resignFirstResponder()
        }
    }
    
}

extension PersonalLoanVC {
    @IBAction func btnOfGetResultAction() {
        if self.checkValidValue() == true {
            self.viewModel.calculateEMI { Bool in
                print("amount : \(self.viewModel.model.amount)")
                print("interestRate : \(self.viewModel.model.interestRate)")
                print("tenure : \(self.viewModel.model.tenure)")
                print("startDate : \(self.viewModel.model.startDate)")
                print("emiPayment : \(self.viewModel.model.emiPayment)")
                
                
                print("totalPayback : \(self.viewModel.model.totalPayback)")
                print("totalInterestPayment : \(self.viewModel.model.totalInterestPayment)")
                print("payOffDate : \(self.viewModel.model.payOffDate)")
                
                
                let vc: PersonalLoanPlanVC = UIStoryboard.instantiateViewController(storyBorad: .Dashboard, controller: .PersonalLoanPlanVC)
                vc.loanDetails = self.viewModel.model
                UIViewController.tabBatVC?.navigationController?.pushViewController(vc, animated: true)
                
            }
            
        }
    }
    
    @IBAction func btnOfBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func checkValidValue() -> Bool {
        
        self.hideKeyBoard()
        
        var message: String? = nil
        
        if self.txtOfAmount?.getText()?.trimmed.count == 0 {
            message = StaticContents.Constants.AmountPlaceHolder
        }else if self.txtOfInterestRate?.getText()?.trimmed.count == 0 {
            message = StaticContents.Constants.InterestRatePlaceHolder
        }else if self.txtOfTenure?.getText()?.trimmed.count == 0 {
            message = StaticContents.Constants.TenurePlaceHolder
        }else if self.txtOfStartLoanDate?.getText()?.trimmed.count == 0 {
            message = StaticContents.Constants.StartDatePlaceHolder
        }
        
        if let message = message {
            
            self.showAlertWith(alertMessage: message,
                               buttonArray: [StaticContents.Constants.OK]) { buttonIndex in
                //Do some action here
            }
            
            return false
        }else {
            self.viewModel.model.amount =  self.txtOfAmount.getText() ?? "0.0"
            self.viewModel.model.interestRate = self.txtOfInterestRate.getText() ?? "0.0"
            self.viewModel.model.tenure = self.txtOfTenure.getText() ?? "0"
        }
        
        return true
    }
}

extension PersonalLoanVC: CustomTextFieldDelegate {
    func didChangeValue(textField: CustomTextField) {
        
    }
    
    func didGetFocused(textField: CustomTextField) {
        if (textField == self.txtOfStartLoanDate ||
            textField == self.txtOfTenure) {
            self.hideKeyBoard()
        }
        
        if textField == self.txtOfStartLoanDate {
            
            let todayDate = Date()
            
            let currentDate = Date.shared.getDate(fromDate: self.viewModel.model.startDate).midnightDate
            
            self.showDatePicker(currentDate: currentDate,
                                minDate: todayDate) { isSuccess, selectedDate in
                if let selectedDate = selectedDate {
                    DispatchQueue.main.async {
                        self.viewModel.model.startDate = selectedDate.midnightDate.getString(fromDate: selectedDate.getString())
                        self.txtOfStartLoanDate?.setText(selectedDate.midnightDate.getString())
                    }
                }
            }
        }
        
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
