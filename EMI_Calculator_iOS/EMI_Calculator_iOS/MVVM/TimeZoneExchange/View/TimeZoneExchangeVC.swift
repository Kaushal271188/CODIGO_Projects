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
    
    func btnOfSelectTimeAction() {
        self.show
    }
    
    func btnOfSelectDateAction() {
        
    }
    
    func btnOfSelectFromTimeZoneAction() {
        
    }
    
    func btnOfSelectToTimeZoneAction() {
        
    }
    
    func btnOfTimeResultAction() {
        
    }
    
    func btnOfDateResultAction() {
        
    }
    
    func btnOfGetResultAction() {
        
    }
    
    
    
    
}
