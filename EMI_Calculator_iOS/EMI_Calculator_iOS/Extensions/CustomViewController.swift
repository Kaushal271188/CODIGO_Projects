//
//  CustomViewController.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 06/07/25.
//

import Foundation
import UIKit
import SlideMenuController

//protocol SlidemenuDelegate {
//    
//    func didOpenLeftMenu()
//    func didCloseLeftMenu()
//    
//    func didOpenRightMenu()
//    func didCloseRightMenu()
//    
//}

private var languageDelegateKey: UInt8 = 0
protocol LanguageDelegate {
    func didChangeLanguage(languageCode: String)
}

var isAppLoaded: Bool = false

extension UIViewController {
    
    enum SlideMenuStatus: String {
        case ShowMain = "ShowMain"
        case OpenLeftMenu = "OpenLeftMenu"
        case CloseLeftMenu = "CloseLeftMenu"
        case OpenRightMenu = "OpenRightMenu"
        case CloseRightMenu = "CloseRightMenu"
    }
    
//    var slidemenuDelegate: SlidemenuDelegate? {
//        nil
//    }
    
    var homeVC: UIViewController {
        get { UIStoryboard.instantiateViewController(storyBorad: .Central, controller: .DashboardVC) }
        set { }
    }
    var toolsVC: UIViewController {
        get { UIStoryboard.instantiateViewController(storyBorad: .Central, controller: .ToolsVC) }
        set { }
    }
    var historyVC: UIViewController {
        get { UIStoryboard.instantiateViewController(storyBorad: .Authentication, controller: .LanguageListVC) }
        set { }
    }
    
    var settingVC: UIViewController {
        get { UIStoryboard.instantiateViewController(storyBorad: .Central, controller: .LeftMenuVC) }
        set { }
    }
    
    var languageDelegate: LanguageDelegate? {
        get {
            return objc_getAssociatedObject(self, &languageDelegateKey) as? LanguageDelegate
        }
        set {
            objc_setAssociatedObject(self, &languageDelegateKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    //For Interstitial advertisement
    /*func loadInterstitial() {
        AdsManager.shared.loadInterstitial(adUnitID: StaticContents.AdsInformation.AdUnitID.rawValue)
    }*/
    
    static var slideMenuVC: SlideMenuController?
    static var centeralNavigationView: UINavigationController?
    
    static var tabBatVC: UITabBarController?
    
    func showInterstitial(from viewController: UIViewController) {
        AdsManager.shared.showInterstitial(from: self,
                                           adUnitID: StaticContents.AdsInformation.AdUnitID_Interstitial) { isSuccess in
            guard isSuccess == true else {
                return
            }
        }
    }
    //------------------------------
    
    //For Rewarded Ads
    /*func loadRewardedAd(from viewController: UIViewController) {
        AdsManager.shared.showRewardedAd(from: viewController) {
            // Handle reward logic
        }
    }*/
    
    func showRewardedAd(from viewController: UIViewController,
                        onReward: @escaping () -> Void) {
        AdsManager.shared.loadRewardedAd(adUnitID: StaticContents.AdsInformation.AdUnitID_Rewarded)
        AdsManager.shared.showRewardedAd(from: viewController) {
            // Handle reward logic
            onReward()
        }
    }
    //------------------------------
    
    //For Banner advertisement
    func showBannerView(rootViewController: UIViewController) {
        let bannerView = AdsManager.shared.createBannerView(adUnitID: StaticContents.AdsInformation.AdUnitID_Banner, rootViewController: rootViewController)
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        rootViewController.view.addSubview(bannerView)
        NSLayoutConstraint.activate([
            bannerView.bottomAnchor.constraint(equalTo: rootViewController.view.safeAreaLayoutGuide.bottomAnchor),
//            bannerView.centerXAnchor.constraint(equalTo: rootViewController.view.centerXAnchor)
            bannerView.leadingAnchor.constraint(equalTo: rootViewController.view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: rootViewController.view.trailingAnchor)
        ])
        
        bannerView.backgroundColor = UIColor.red
    }
    //------------------------------
    
    func setSlideMenuViewController(mainViewController: UIViewController,
                                    leftViewController: UIViewController? = nil,
                                    rightViewController: UIViewController? = nil) {
        
        UIViewController.centeralNavigationView = UINavigationController.init(rootViewController: mainViewController)
        UIViewController.centeralNavigationView?.navigationBar.isHidden = true
        
        UIViewController.slideMenuVC = SlideMenuController(mainViewController: UIViewController.centeralNavigationView!,
                                                           leftViewController: leftViewController,
                                                           rightViewController: rightViewController)
        
        if leftViewController == nil {
            UIViewController.slideMenuVC?.allowedLeftSwipe = false
        }
        
        if rightViewController == nil {
            UIViewController.slideMenuVC?.allowedRightSwipe = false
        }
        
        
    }
    
    func slideMenu(slideMenuStatus: SlideMenuStatus) {
        
        switch slideMenuStatus {
        case .OpenLeftMenu:
            UIViewController.slideMenuVC?.showLeft()
            break
        case .CloseLeftMenu:
            UIViewController.slideMenuVC?.toggleLeft()
            break
        case .OpenRightMenu:
            UIViewController.slideMenuVC?.showRight()
            break
        case .CloseRightMenu:
            UIViewController.slideMenuVC?.toggleRight()
            break
        case .ShowMain:
            UIViewController.slideMenuVC?.showMain()
        }
    }
    
    func setTabbarController() {
        UIViewController.tabBatVC = UITabBarController()
        
        self.homeVC = UIStoryboard.instantiateViewController(storyBorad: .Central, controller: .DashboardVC)
        self.toolsVC = UIStoryboard.instantiateViewController(storyBorad: .Central, controller: .ToolsVC)
        self.historyVC = UIStoryboard.instantiateViewController(storyBorad: .Authentication, controller: .LanguageListVC)
        self.settingVC = UIStoryboard.instantiateViewController(storyBorad: .Central, controller: .LeftMenuVC)
        
        
//        self.homeVC.tabBarItem = UITabBarItem(title: StaticContents.Constants.HomeTitle,
//                                              image: UIImage.getSystemImage(image: .HomeTabUnselectedIcon),
//                                              selectedImage: UIImage.getSystemImage(image: .HomeTabSelectedIcon))
//
//        self.toolsVC.tabBarItem = UITabBarItem(title: StaticContents.Constants.ToolsTabTitle,
//                                               image: UIImage.getSystemImage(image: .ToolsTabUnselectedIcon),
//                                               selectedImage: UIImage.getSystemImage(image: .ToolsTabSelectedIcon))
//
//        self.historyVC.tabBarItem = UITabBarItem(title: StaticContents.Constants.HistoryTabTitle,
//                                                 image: UIImage.getSystemImage(image: .HistoryTabUnselectedIcon),
//                                                 selectedImage: UIImage.getSystemImage(image: .HistoryTabSelectedIcon))
//
//        self.settingVC.tabBarItem = UITabBarItem(title: StaticContents.Constants.SettingsTitle,
//                                                 image: UIImage.getSystemImage(image: .SettingsTabUnselectedIcon),
//                                                 selectedImage: UIImage.getSystemImage(image: .SettingsTabSelectedIcon))
        
        
        UIViewController.tabBatVC?.tabBar.tintColor = UIColor.PrimaryTheme
        UIViewController.tabBatVC?.tabBar.unselectedItemTintColor = UIColor.UnselectedTabColor
        
        UIViewController.tabBatVC?.tabBar.backgroundColor = UIColor.TabbarBGColor
        
        UIViewController.tabBatVC?.viewControllers = [homeVC, toolsVC, historyVC, settingVC]
        
        self.changeTabTitle()

    }
    
    func changeTabTitle() {
        UIViewController.tabBatVC?.viewControllers?[0].tabBarItem = UITabBarItem(title: StaticContents.Constants.HomeTitle,
                                                                                       image: UIImage.getSystemImage(image: .HomeTabUnselectedIcon),
                                                                                       selectedImage: UIImage.getSystemImage(image: .HomeTabSelectedIcon))
        
        UIViewController.tabBatVC?.viewControllers?[1].tabBarItem = UITabBarItem(title: StaticContents.Constants.ToolsTabTitle,
                                                                                 image: UIImage.getSystemImage(image: .ToolsTabUnselectedIcon),
                                                                                 selectedImage: UIImage.getSystemImage(image: .ToolsTabSelectedIcon))
        
        UIViewController.tabBatVC?.viewControllers?[2].tabBarItem = UITabBarItem(title: StaticContents.Constants.HistoryTabTitle,
                                                                                 image: UIImage.getSystemImage(image: .HistoryTabUnselectedIcon),
                                                                                 selectedImage: UIImage.getSystemImage(image: .HistoryTabSelectedIcon))
        
        UIViewController.tabBatVC?.viewControllers?[3].tabBarItem = UITabBarItem(title: StaticContents.Constants.SettingsTitle,
                                                                                 image: UIImage.getSystemImage(image: .SettingsTabUnselectedIcon),
                                                                                 selectedImage: UIImage.getSystemImage(image: .SettingsTabSelectedIcon))
        
    }
    
    /// To display native alert in entire
    /// - Parameters:
    ///   - alertTitle: Title of alert view.
    ///   - alertMessage: Message to be display.
    ///   - buttonArray: Buttons which is use to instruct user to select based on condition of alert message types : Error, instruction, question etc..
    ///   - completion: Get the response to the location from where alert was display and give the user's button selection, based on that the next action will be take,
    func showAlertWith(alertTitle:String? = nil,
                       alertMessage:String,
                       buttonArray:[String],
                       completion:@escaping ((_ buttonIndex : Int) -> ())) {
        
        let alertController = UIAlertController(title: alertTitle,
                                                message: alertMessage,
                                                preferredStyle: .alert)
        
        for i in 0..<buttonArray.count {
            
            //Create button to do some actions
            let alertButton = UIAlertAction(title: (buttonArray[i]), style: .default, handler: { UIAlertAction in
                
                //Return Button Index which selected by User
                completion(i)
                
                //Dismis the alert view after select the action.
                alertController.dismiss(animated: true, completion: {
                    
                })
            })
            
            //Add action button to the alert
            alertController.addAction(alertButton)
        }
        
        
        DispatchQueue.main.async {
            //Present alert viewcontroller in visibled view controller.
            if let tempWindow = UIApplication.shared.currentWindow {
                let visibleVC = tempWindow.rootViewController
                visibleVC?.present(alertController, animated: true, completion: nil)
            }
            
            //Present alert viewcontroller in visibled view controller.
//            let visibleVC = UIApplication.shared.keyWindow?.rootViewController
//            visibleVC?.present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc func showDatePicker(fromSourceView: UIView? = nil,
                              title: String? = nil,
                              message: String? = "\n\n\n\n\n\n\n\n\n\n",
                              currentDate: Date,
                              minDate: Date? = nil,
                              maxDate: Date? = nil,
                              datePickerMode: UIDatePicker.Mode = .date,
                              datePickerStyle: UIDatePickerStyle = .wheels,
                              completionHandler: @escaping(_ isSuccess: Bool,_ selectedDate: Date?) -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let datePicker = UIDatePicker()
        
        // Force 24-hour format
        datePicker.locale = Locale(identifier: "en_GB") // en_GB uses 24-hour format
        datePicker.calendar = Calendar(identifier: .gregorian)
        
        datePicker.date = currentDate
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
        
        datePicker.datePickerMode = datePickerMode
        datePicker.preferredDatePickerStyle = datePickerStyle
        datePicker.frame = CGRect(x: 0, y: 15, width: alert.view.bounds.width - 20, height: 200)
        
        alert.view.addSubview(datePicker)
        
        let selectAction = UIAlertAction(title: StaticContents.Constants.Done, style: .default) { _ in
//            let formatter = DateFormatter()
//            formatter.dateStyle = .medium
//            self.selectedDateLabel.text = "Selected: \(formatter.string(from: datePicker.date))"
            completionHandler(true ,datePicker.date)
        }
        
        let cancelAction = UIAlertAction(title: StaticContents.Constants.Cancel, style: .cancel) { _ in
            completionHandler(false ,nil)
        }
        
        alert.addAction(selectAction)
        alert.addAction(cancelAction)
        
        // For iPad compatibility
        
        if let fromSourceView = fromSourceView {
            if let popoverController = alert.popoverPresentationController {
                popoverController.sourceView = fromSourceView
                popoverController.sourceRect = fromSourceView.bounds
            }
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func showDataPicker(fromSourceView: UIView? = nil,
                        title: String? = nil,
                        message: String? = "\n\n\n\n\n\n\n\n\n\n",
                        items: [String]? = nil,
                        item: String? = nil,
                        completionHandler: @escaping(_ isSuccess: Bool,_ selectedValue: String?,_ selectedIndex: Int?) -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        
        if let items = items {
            var pickerView = UIPickerView()
            pickerView.frame = CGRect(x: 0, y: 15, width: alert.view.bounds.width - 20, height: 200)
            
            let preselectedIndex: Int = (item != nil ? items.firstIndex(of: item!) : 0)!
            
            let singlePicker = SingleComponentPicker(pickerView: pickerView, items: items, preselectedIndex: preselectedIndex)

            alert.view.addSubview(pickerView)
            
            let selectAction = UIAlertAction(title: StaticContents.Constants.Done, style: .default) { _ in
    //            let formatter = DateFormatter()
    //            formatter.dateStyle = .medium
    //            self.selectedDateLabel.text = "Selected: \(formatter.string(from: datePicker.date))"
                
                if let selectedItem = singlePicker.getSelectedValue() {
                    let selectedIndex = items.firstIndex(of: selectedItem)
                    completionHandler(true, selectedItem, selectedIndex)
                }else {
                    completionHandler(false, nil, nil)
                }
                
            }
            
            let cancelAction = UIAlertAction(title: StaticContents.Constants.Cancel, style: .cancel) { _ in
                completionHandler(false, nil, nil)
            }
            
            alert.addAction(selectAction)
            alert.addAction(cancelAction)
            
            // For iPad compatibility
            
            if let fromSourceView = fromSourceView {
                if let popoverController = alert.popoverPresentationController {
                    popoverController.sourceView = fromSourceView
                    popoverController.sourceRect = fromSourceView.bounds
                }
            }
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
}

extension UIViewController {
    func changeLanguageCode(languageCode: String) {
        APPDELEGATE.setApplicationFlow()
        if let languageDelegate = self.languageDelegate {
            languageDelegate.didChangeLanguage(languageCode: languageCode)
        }
    }
}
