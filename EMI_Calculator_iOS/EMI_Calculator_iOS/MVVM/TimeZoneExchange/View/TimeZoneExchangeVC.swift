//
//  TimeZoneExchangeVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 14/07/25.
//

import UIKit

class TimeZoneExchangeVC: UIViewController {

    @IBOutlet weak var btnOfSelectTime: UIButton!
    @IBOutlet weak var btnOfSelectDate: UIButton!
    
    @IBOutlet weak var btnOfSelectFromTimeZone: UIButton!
    @IBOutlet weak var btnOfSelectToTimeZone: UIButton!
    
    @IBOutlet weak var btnOfTimeResult: UIButton!
    @IBOutlet weak var btnOfDateResult: UIButton!
    
    @IBOutlet weak var btnOfGetResult: UIButton!
    
    
    var zoneExchangeModel = TimeZoneExchangeModel()
    
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

extension TimeZoneExchangeVC {
    
    func setViewFormate() {
        
    }
    
}

extension TimeZoneExchangeVC {
    
    @IBAction func btnOfSelectTimeAction() {
        self.showDatePicker(fromSourceView: self.btnOfSelectTime,
                            currentDate: Date(),
                            maxDate: nil,
                            datePickerMode: .time,
                            datePickerStyle: .wheels) { isSuccess, selectedDate in
            debugPrint("is Success: \(isSuccess), selected Date: \(selectedDate)")
        }
    }
    
    @IBAction func btnOfSelectDateAction() {
        
    }
    
    @IBAction func btnOfSelectFromTimeZoneAction() {
        let arrayOfItems = ["a", "b", "c", "d"]
        let selectedItem = "d"
        
        self.showDataPicker(fromSourceView: self.btnOfSelectFromTimeZone,
                            items: arrayOfItems,
                            item: selectedItem) { isSuccess, selectedValue, selectedIndex in
            debugPrint("isSuccess: \(isSuccess)\nselectedValue: \(selectedValue)\nselectedIndex: \(selectedIndex)")
        }
    }
    
    @IBAction func btnOfSelectToTimeZoneAction() {
        
    }
    
    @IBAction func btnOfTimeResultAction() {
        
    }
    
    @IBAction func btnOfDateResultAction() {
        
    }
    
    @IBAction func btnOfGetResultAction() {
        
    }
    
    
    
    
}
