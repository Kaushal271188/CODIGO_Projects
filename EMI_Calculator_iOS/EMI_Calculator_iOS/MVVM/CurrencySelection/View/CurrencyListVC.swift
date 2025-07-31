//
//  CurrencyListVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 09/07/25.
//

import UIKit

class CurrencyListVC: UIViewController {

    @IBOutlet weak var lblOfNavTitle: UILabel!
    @IBOutlet weak var lblOfNavSubTitle: UILabel!
    
    @IBOutlet weak var tableOfCurrencyList: CurrencyListTableView!
    
    @IBOutlet weak var btnOfGoNextView: UIButton!
    
    
    //Closure to get the object of selected language.
    var didSelectCurrency: ((_ selectedInfo: CurrencyListModel) -> Void)? = nil
    
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

extension CurrencyListVC {
    
    func setViewFormate() {
        
        self.btnOfGoNextView?.isHidden = (self.tableOfCurrencyList?.viewModel.selectedCurrency == nil)
        
        self.lblOfNavTitle?.text = StaticContents.Constants.LanguageTitle
        self.lblOfNavSubTitle?.text = StaticContents.Constants.LanguageSubtitle
        
        self.tableOfCurrencyList.didSelectCurrency = { ccurrentInfo in
            //Do some action here.
            if let didSelectCurrency = self.didSelectCurrency {
                didSelectCurrency(ccurrentInfo)
            }
            
            self.btnOfGoNextView?.isHidden = (self.tableOfCurrencyList?.viewModel.selectedCurrency == nil)
//            self.navigationController?.pushViewController(UIViewController.slideMenuVC!, animated: true)
            
        }
    }
    
    @IBAction func btnOfGoNextViewAction() {
        
        guard let _ = self.selectedCorrency else {
            return
        }
        
        if let tabBarController = self.tabBarController {
            self.navigationController?.pushViewController(tabBarController, animated: true)
        }
    }
    
}
