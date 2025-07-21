//
//  SplashScreenVC.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 19/05/25.
//

import UIKit

class SplashScreenVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let mainViewController = UIStoryboard.instantiateViewController(storyBorad: .Central, controller: .DashboardVC)
        let leftViewController = UIStoryboard.instantiateViewController(storyBorad: .Central, controller: .LeftMenuVC)
        self.setSlideMenuViewController(mainViewController: mainViewController,
                                        leftViewController: leftViewController)
        
        self.setTabbarController()
        
//        AdsManager.shared.adsCustomDelegate = self
//        self.showInterstitial(from: self)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.startApplication()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func startApplication() {
        let vc = UIStoryboard.instantiateViewController(storyBorad: .Authentication, controller: .LanguageListVC)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
}


extension SplashScreenVC: AdsCustomDelegate {
    func didAdsDismiss() {
        self.startApplication()
    }
    
    
    func didAdsShow() {
        //Do some logic here.
    }
    
    
    
}
