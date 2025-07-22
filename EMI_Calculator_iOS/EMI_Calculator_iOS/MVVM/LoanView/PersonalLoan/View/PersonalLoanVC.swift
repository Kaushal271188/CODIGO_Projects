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
        
        self.txtOfStartLoanDate?.textField.text = self.viewModel.startDate
        
    }
    
    func setTextFieldFormate(textField: CustomTextField) {
        textField.setViewFormate()
        textField.customTextFieldDelegate = self
    }
    
    func hideKeyBoard() {
        DispatchQueue.main.async {
            self.txtOfAmount?.textField.resignFirstResponder()
//            self.txtOfTenure?.textField.resignFirstResponder()
            self.txtOfInterestRate?.textField.resignFirstResponder()
//            self.txtOfStartLoanDate?.textField.resignFirstResponder()
        }
    }
    
}

extension PersonalLoanVC {
    @IBAction func btnOfBackAction() {
        self.navigationController?.popViewController(animated: true)
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
            
            self.showDatePicker(currentDate: self.viewModel.model.startDate,
                                minDate: todayDate) { isSuccess, selectedDate in
                if let selectedDate = selectedDate {
                    DispatchQueue.main.async {
                        self.viewModel.model.startDate = selectedDate
                        self.txtOfStartLoanDate?.textField.text = self.viewModel.startDate
                    }
                }
            }
        }
        
        if textField == self.txtOfTenure {
            
            let tenureTime = stride(from: 0, through: 360, by: 1).map({"\($0)"})
            let selectedTime = (self.txtOfTenure?.textField.text?.count ?? 0) > 0 ? self.txtOfTenure?.textField.text?.trimmed : nil
            
            self.showDataPicker(fromSourceView: self.txtOfTenure.textField,
                                items: tenureTime,
                                item: selectedTime) { isSuccess, selectedValue, selectedIndex in
                if let selectedValue = selectedValue {
                    DispatchQueue.main.async {
                        self.txtOfTenure?.textField.text = selectedValue
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
