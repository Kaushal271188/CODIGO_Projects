//
//  CustomOTPView.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 05/06/25.
//

import Foundation
import SROTPView

class CustomOTPView: SROTPView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupViewFormate()
    }
    
    private func setupViewFormate() {
        self.otpTextFieldsCount = 4
        self.otpTextFieldActiveBorderColor = UIColor.white
        self.otpTextFieldDefaultBorderColor = UIColor.green
        self.otpTextFieldFontColor = UIColor.green
        self.activeHeight = 4
        self.inactiveHeight = 2
        self.otpType = .Bordered //.Rounded for round
        self.otpEnteredString = { pin in
            print("The entered pin is \(pin)")
        }
        self.setUpOtpView()
//        self.initializeUI()
    }
    
}
