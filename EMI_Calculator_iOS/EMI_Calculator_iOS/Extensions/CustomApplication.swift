//
//  CustomApplication.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 22/07/25.
//

import Foundation
import UIKit

extension UIApplication {
    var currentWindow: UIWindow? {
        // Loop through connected scenes
        return self
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .first(where: { $0.activationState == .foregroundActive })?
            .windows
            .first(where: { $0.isKeyWindow })
    }
}
