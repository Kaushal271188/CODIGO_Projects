//
//  PersonalLoanPlanVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 22/07/25.
//

import UIKit

class PersonalLoanPlanVC: UIViewController {

//    var loanDetails: PersonalLoanPlanModel? = nil
    var loanDetails: LoanInfo? = nil
    
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
        self.setViewData()
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

extension PersonalLoanPlanVC {
    
    @IBAction func btnOfBackAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}


extension PersonalLoanPlanVC {
    
    func setViewFormate() {
        
    }
    
    func setViewData() {
        
        guard let loanDetails = self.loanDetails else {
            return
        }
        
        self.lblOfAmountValue?.text = loanDetails.amount
        self.lblOfEMIValue?.text = loanDetails.emiPayment
        
        
//        self.parentOfAmount?.text =
        self.lblOfAmountTitle?.text = StaticContents.Constants.AmountTitle
        self.lblOfAmountValue?.text = loanDetails.amount
        
        self.lblOfMonthlyEMITitle?.text = StaticContents.Constants.MonthlyPayBackEMITitle
        self.lblOfEMIValue?.text = loanDetails.emiPayment
        
        self.lblOfLoanTenureTitle?.text = StaticContents.Constants.LoanTenureLoanTermTitle
        self.lblOfLoanTenureValue?.text = loanDetails.tenure
        
        self.lblOfInterestRateTitle?.text = StaticContents.Constants.InterestRateTitle
        self.lblOfInterestRateValue?.text = loanDetails.interestRate
        
        self.lblOfPayoffDateTitle?.text = StaticContents.Constants.PayOffDateTitle
        self.lblOfPayoffDateValue?.text = loanDetails.payOffDate
        
        self.lblOfTotalInterestRateTitle?.text = StaticContents.Constants.TotalInterestTitle
        self.lblOfTotalInterestRateValue?.text = loanDetails.totalInterestPayment
        
        self.lblOfTotalPaybackAmountTitle?.text = StaticContents.Constants.TotalPayBackAmountTitle
        self.lblOfTotalPaybackAmountValue?.text = loanDetails.totalPayback
        
        
    }
    
}
