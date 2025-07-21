//
//  CustomTextField.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import UIKit

class CustomTextField: UIView {

    struct CustomTextFieldInfo {
        var title: String? = nil
        var placeHolder: String? = nil
        var rightValue: String? = nil
    }
    
    @IBOutlet var contentView: UIStackView!
    @IBOutlet weak var lblOfTitle: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var btnOfRightValue: UIButton!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.setViewFormate()
    }
    
    init(textFieldInfo : CustomTextFieldInfo) {
        self.setViewFormate(textFieldInfo: textFieldInfo)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
//        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewFormate(textFieldInfo : CustomTextFieldInfo) {
        
        self.btnOfRightValue?.setTitle(textFieldInfo.rightValue, for: .normal)
        
        self.btnOfRightValue?.isHidden = (textFieldInfo.rightValue == nil)
        
        self.textField?.keyboardType = .numberPad
//        self.textField?.delegate = self
        self.textField?.placeholder = textFieldInfo.placeHolder
        
        self.layer.borderColor = UIColor.DarkGrayColor.cgColor
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 5.0
    }
    
    // MARK: - Setup
    private func commonInit() {
        Bundle.main.loadNibNamed("PhoneNumberView", owner: self, options: nil)
        contentView.fixInView(self)
    }
    
}

extension CustomTextField {
    
    
    
}
