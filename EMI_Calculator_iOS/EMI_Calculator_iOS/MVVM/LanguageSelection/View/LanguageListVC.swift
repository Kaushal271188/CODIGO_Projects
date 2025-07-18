//
//  LanguageListVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 05/07/25.
//

import UIKit

class LanguageListVC: UIViewController {
    
    @IBOutlet weak var lblOfNavTitle: UILabel!
    @IBOutlet weak var lblOfNavSubTitle: UILabel!

    @IBOutlet weak var tableViewOfLanguageList: TableViewOfLanguageList!
    
    @IBOutlet weak var btnOfGoNextView: UIButton!
    
    //Closure action of select Language
    var didSelectLanguage: ((_ selectedLangauge: LanguageListModel) -> Void)? = nil
    
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

extension LanguageListVC {
    
    func setViewFormate() {
        
        self.btnOfGoNextView?.isHidden = (self.tableViewOfLanguageList?.viewModel.selectedLanguage == nil)
        
        self.lblOfNavTitle?.text = StaticContents.Constants.LanguageTitle
        self.lblOfNavSubTitle?.text = StaticContents.Constants.LanguageSubtitle
        
        self.tableViewOfLanguageList.didSelectLanguage = { languageInfo in
            //Do some action here.
//            let vc = UIStoryboard.instantiateViewController(storyBorad: .Authentication, controller: .LoginVC)
//            self.navigationController?.pushViewController(vc, animated: true)
            if let didSelectLanguage = self.didSelectLanguage {
                didSelectLanguage(languageInfo)
            }
            
            self.btnOfGoNextView?.isHidden = (self.tableViewOfLanguageList?.viewModel.selectedLanguage == nil)
        }
    }
    
    @IBAction func btnOfGoNextViewAction() {
        let vc = UIStoryboard.instantiateViewController(storyBorad: .Authentication, controller: .IntroductionVC)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
}
