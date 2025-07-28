//
//  View.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 25/05/25.
//

import Foundation
import UIKit

private var cornerRadiusKey: UInt8 = 0
private var borderWidthKey: UInt8 = 0
private var borderColorKey: UInt8 = 0
//private var allowCustomPropertyKey: UInt8 = 0

@IBDesignable
extension UIView {
    
//    @IBInspectable var allowCustomProperty: Bool {
//        get {
//            return objc_getAssociatedObject(self, &allowCustomPropertyKey) as? Bool ?? false
//        }
//        set {
//            objc_setAssociatedObject(self, &allowCustomPropertyKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//            if newValue == true {
//
//            }
//        }
//    }
    
    @IBInspectable var customCorderRadius: CGFloat {
        get {
            return objc_getAssociatedObject(self, &cornerRadiusKey) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &cornerRadiusKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var customBorderWidth: CGFloat {
        get {
            return objc_getAssociatedObject(self, &borderWidthKey) as? CGFloat ?? 0
        }
        set {
            objc_setAssociatedObject(self, &borderWidthKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var customBorderColor: UIColor {
        get {
            return objc_getAssociatedObject(self, &borderColorKey) as? UIColor ?? .clear
        }
        set {
            objc_setAssociatedObject(self, &borderColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        // Optional: Custom code to make sure your view renders well in IB
    }
    
    
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
