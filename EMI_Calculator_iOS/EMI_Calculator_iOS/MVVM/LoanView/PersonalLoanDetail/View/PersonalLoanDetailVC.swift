//
//  PersonalLoanDetailVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 22/07/25.
//

import UIKit

class PersonalLoanDetailVC: UIViewController {

    @IBOutlet weak var parentOfAmount: UIView!
    @IBOutlet weak var lblOfAmountTitle: UILabel!
    @IBOutlet weak var lblOfAmountValue: UILabel!
    
    @IBOutlet weak var lblOfMonthlyEMITitle: UILabel!
    @IBOutlet weak var lblOfEMIValue: UILabel!
    
    @IBOutlet weak var lblOfLoanTenureTitle: UILabel!
    @IBOutlet weak var lblOfLoanTenureValue: UILabel!
    
    @IBOutlet weak var lblOfInterestRateTitle: UILabel!
    @IBOutlet weak var lblOfInterestRateValue: UILabel!
    
    @IBOutlet weak var lblOfPayoffDateTitle: UILabel!
    @IBOutlet weak var lblOfPayoffDateValue: UILabel!
    
    @IBOutlet weak var lblOfTotalInterestRateTitle: UILabel!
    @IBOutlet weak var lblOfTotalInterestRateValue: UILabel!
    
    @IBOutlet weak var lblOfTotalPaybackAmountTitle: UILabel!
    @IBOutlet weak var lblOfTotalPaybackAmountValue: UILabel!
    
    
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
