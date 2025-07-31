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
        
        self.tableViewOfLeftMenu?.didSelectOption = { selectedOption in
            //Do some action here
//            self.slideMenu(slideMenuStatus: .CloseLeftMenu)
            
            var vc: UIViewController? = nil
            
            if selectedOption.optionTitle == StaticContents.Constants.RemoveAds {
                
            }else if selectedOption.optionTitle == StaticContents.Constants.AboutUs {
                vc = UIStoryboard.instantiateViewController(storyBorad: .Settings, controller: .WebVC) as! WebVC
                (vc as! WebVC).content = "https://www.google.com"
                (vc as! WebVC).viewTitle = selectedOption.optionTitle
            }else if selectedOption.optionTitle == StaticContents.Constants.RateUs {
                AppReview.setAppReviews()
            }else if selectedOption.optionTitle == StaticContents.Constants.Share {
                let sharingData = SharingData(text: StaticContents.AppConfig.AppStoreURL)
                self.shareData(sharingData: sharingData)
            }
            
            if let vc = vc {
                self.tabBarController?.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
    }
    
}
