//
//  LeftMenuVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 10/07/25.
//

import UIKit

class LeftMenuVC: UIViewController {

    @IBOutlet weak var lblOfNavTitle: UILabel!
    @IBOutlet weak var lblOfNavSubTitle: UILabel!
    
    @IBOutlet var tableViewOfLeftMenu: TableViewOfLeftMenu!
    
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

extension LeftMenuVC {
    
    func setViewFormate() {
        self.lblOfNavTitle?.text = StaticContents.Constants.AppFullName
        self.lblOfNavSubTitle?.text = StaticContents.Constants.AppShortName
        
        self.tableViewOfLeftMenu?.didSelectOption = { languageInfo in
            //Do some action here
            self.slideMenu(slideMenuStatus: .CloseLeftMenu)
        }
    }
    
}
