//
//  AlertView.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 22/05/25.
//

import Foundation
import UIKit

class AlertView: NSObject {
    
//    static let shared = AlertView()
    
    var arrayOfPickerData = [String]()
    
    /// To display native alert in entire
    /// - Parameters:
    ///   - alertTitle: Title of alert view.
    ///   - alertMessage: Message to be display.
    ///   - buttonArray: Buttons which is use to instruct user to select based on condition of alert message types : Error, instruction, question etc..
    ///   - completion: Get the response to the location from where alert was display and give the user's button selection, based on that the next action will be take,
    static func showAlertWith(alertTitle:String? = nil,
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
            if let tempWindow = UIApplication.shared.keyWindow_ {
                let visibleVC = tempWindow.rootViewController
                visibleVC?.present(alertController, animated: true, completion: nil)
            }
            
            //Present alert viewcontroller in visibled view controller.
//            let visibleVC = UIApplication.shared.keyWindow?.rootViewController
//            visibleVC?.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}
