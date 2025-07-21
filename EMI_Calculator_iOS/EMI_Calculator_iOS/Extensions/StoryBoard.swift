//
//  CustomStoryBoard.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 20/05/25.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    enum StoryBoard: String {
        case Main = "Main"
        case Authentication = "Authentication"
        case Dashboard = "Dashboard"
        case Central = "Central"
        case Tools = "Tools"
    }
    
    enum Controller: String {
        case SplashScreenVC = "SplashScreenVC"
        case LoginVC = "LoginVC"
        case CountryListVC = "CountryListVC"
        case LanguageListVC = "LanguageListVC"
        case CurrencyListVC = "CurrencyListVC"
        case IntroductionVC = "IntroductionVC"
        case ToolsVC = "ToolsVC"
        case TimeZoneExchangeVC = "TimeZoneExchangeVC"
        
        
        case DashboardVC = "DashboardVC"
        case LeftMenuVC = "LeftMenuVC"
    }
    
    static func instantiateViewController<T: UIViewController>(storyBorad: StoryBoard, controller: Controller) -> T {
        
        let currentStoryBoard = UIStoryboard(name: storyBorad.rawValue, bundle: nil)
        
        guard let viewController = currentStoryBoard.instantiateViewController(withIdentifier: controller.rawValue) as? T else {
            fatalError("Could not instantiate view controller with identifier \(controller.rawValue) as \(T.self)")
        }
        
        return viewController
    }
    
    
    
}
