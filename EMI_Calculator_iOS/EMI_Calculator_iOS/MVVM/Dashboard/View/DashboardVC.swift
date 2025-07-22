//
//  DashboardVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 10/07/25.
//

import UIKit

class DashboardVC: UIViewController {

    @IBOutlet weak var btnOfMenu: UIButton!
    
    @IBOutlet weak var lblOfNavTitle: UILabel!
    @IBOutlet weak var lblOfNavSubTitle: UILabel!
    
    @IBOutlet weak var collectionViewOfOptions: CollectionViewOfDashboardOptions!
    @IBOutlet weak var tableViewOfDashboardOptions: TableViewOfDashboardOptions!
    
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


extension DashboardVC {
    
    func setViewFormate() {
        self.lblOfNavTitle?.text = StaticContents.Constants.HomeTitle
        self.lblOfNavSubTitle?.text = StaticContents.Constants.HomeTitle
        self.lblOfNavSubTitle?.isHidden = true
        
        self.tableViewOfDashboardOptions?.didSelectOption = { optionInfo in
            let vc = UIStoryboard.instantiateViewController(storyBorad: .Dashboard, controller: .PersonalLoanVC)
            UIViewController.tabBatVC?.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @IBAction func btnOfMenuAction() {
        self.slideMenu(slideMenuStatus: .OpenLeftMenu)
    }
    
}
