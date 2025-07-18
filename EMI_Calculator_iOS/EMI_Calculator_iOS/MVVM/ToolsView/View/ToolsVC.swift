//
//  ToolsVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 14/07/25.
//

import UIKit

class ToolsVC: UIViewController {

    @IBOutlet weak var lblOfNavTitle: UILabel!
    @IBOutlet weak var lblOfNavSubTitle: UILabel!
    
    @IBOutlet var tableOfToolOptions: TableOfToolOptions!
    
    
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


extension ToolsVC {
    
    func setViewFormate() {
        self.lblOfNavTitle?.text = StaticContents.Constants.ToolsViewTitle
//        self.lblOfNavSubTitle?.text = StaticContents.Constants.AppShortName
        self.lblOfNavSubTitle?.isHidden = true
        
        self.tableOfToolOptions?.didSelectOption = { option in
            //Do some action here
//            self.slideMenu(slideMenuStatus: .CloseLeftMenu)
            let vc = UIStoryboard.instantiateViewController(storyBorad: .Tools, controller: .TimeZoneExchangeVC)
            UIViewController.tabBatVC?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
