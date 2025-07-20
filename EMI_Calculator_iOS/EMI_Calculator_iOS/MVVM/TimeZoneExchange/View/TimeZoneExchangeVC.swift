//
//  TimeZoneExchangeVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 14/07/25.
//

import UIKit

class TimeZoneExchangeVC: UIViewController {

    @IBOutlet weak var lblOfNavTitle: UILabel!
    @IBOutlet weak var lblOfNavSubTitle: UILabel!
    
    @IBOutlet weak var btnOfSelectTime: UIButton!
    @IBOutlet weak var btnOfSelectDate: UIButton!
    
    @IBOutlet weak var btnOfSelectFromTimeZone: UIButton!
    @IBOutlet weak var btnOfSelectToTimeZone: UIButton!
    
    @IBOutlet weak var btnOfTimeResult: UIButton!
    @IBOutlet weak var btnOfDateResult: UIButton!
    
    @IBOutlet weak var btnOfGetResult: UIButton!
    
    
    var viewModel = TimeZoneExchangeViewModel()
    
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

extension TimeZoneExchangeVC {
    
    func setViewFormate() {
        self.lblOfNavTitle?.text = StaticContents.Constants.TimezoneExchangeTitle
        self.lblOfNavSubTitle?.text = StaticContents.Constants.TimezoneExchangeDesciption
        self.lblOfNavSubTitle?.isHidden = true
    }
    
    
}

extension TimeZoneExchangeVC {
    
    @IBAction func btnOfSelectTimeAction() {
        
        self.showDatePicker(fromSourceView: self.btnOfSelectTime,
                            currentDate: self.viewModel.selectedDate,
                            maxDate: nil,
                            datePickerMode: .time,
                            datePickerStyle: .wheels) { isSuccess, selectedDate in
            if let selectedDate = selectedDate {
                self.viewModel.selectedDate = selectedDate
            }
            debugPrint("is Success: \(isSuccess), selected Date: \(selectedDate)")
        }
    }
    
    @IBAction func btnOfSelectDateAction() {
        
    }
    
    @IBAction func btnOfSelectFromTimeZoneAction() {
        let arrayOfItems = viewModel.arrayOfTimezone
        let selectedItem = self.btnOfSelectFromTimeZone.currentTitle
        
        self.showDataPicker(fromSourceView: nil,
                            items: arrayOfItems,
                            item: selectedItem) { isSuccess, selectedValue, selectedIndex in
            
            self.btnOfSelectFromTimeZone.setTitle(selectedValue, for: .normal)
            debugPrint("isSuccess: \(isSuccess)\nselectedValue: \(selectedValue)\nselectedIndex: \(selectedIndex)")
        }
    }
    
    @IBAction func btnOfSelectToTimeZoneAction() {
        let arrayOfItems = viewModel.arrayOfTimezone
        let selectedItem = self.btnOfSelectToTimeZone.currentTitle
        
        self.showDataPicker(fromSourceView: nil,
                            items: arrayOfItems,
                            item: selectedItem) { isSuccess, selectedValue, selectedIndex in
            
            self.btnOfSelectToTimeZone.setTitle(selectedValue, for: .normal)
            debugPrint("isSuccess: \(isSuccess)\nselectedValue: \(selectedValue)\nselectedIndex: \(selectedIndex)")
        }
    }
    
    @IBAction func btnOfTimeResultAction() {
        
    }
    
    @IBAction func btnOfDateResultAction() {
        
    }
    
    @IBAction func btnOfGetResultAction() {
        
    }
    
    @IBAction func btnOfBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
