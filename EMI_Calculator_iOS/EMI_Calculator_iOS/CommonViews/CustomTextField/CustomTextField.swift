//
//  CustomTextField.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import UIKit

protocol CustomTextFieldDelegate {
    func didGetFocused(textField: CustomTextField)
    func didLostFocused(textField: CustomTextField)
    func didChangeValue(textField: CustomTextField)
}

class CustomTextField: UIView {
    
    var customTextFieldDelegate: CustomTextFieldDelegate?
    
    private let nibName = "CustomTextField"

    private let minAmount = 1000
    private let maxAmount = 100000000000
    
    private let minPercentage = 0
    private let maxPercentage = 100
    
    private let minMonths = 1
    private let maxMonths = 360
    
    enum TextFieldType: Int {
        case Default = 0
        case Amount = 1
        case Percentage = 2
        case Tenure = 3
        case DropDown = 4
        case Date = 5
        case Time = 6
    }
    
    struct CustomTextFieldInfo {
        var title: String? = nil
        var placeHolder: String? = nil
        var rightValue: String? = nil
        var textFieldType: TextFieldType = .Default
    }
    
    var textFieldInfo: CustomTextFieldInfo? = nil
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var lblOfTitle: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var btnOfRightValue: UIButton!
    
    // MARK: - Public Closures for Set and Get
    lazy var setText: (String) -> Void = { [weak self] value in
        self?.textField.text = value
    }
    
    lazy var getText: () -> String? = { [weak self] in
        return self?.textField.text
    }
    
    lazy var getFocuss: () -> Void = { [weak self] in
        self?.textField?.becomeFirstResponder()
    }
    
    lazy var lostFocuss: () -> Void = { [weak self] in
        self?.textField?.resignFirstResponder()
    }
    
    lazy var clearText: () -> Void = { [weak self] in
        self?.textField?.text = ""
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
//        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setViewFormate()
    }
    
    
    func setViewFormate() {
        
        guard let textFieldInfo = textFieldInfo else {
            return
        }
        
        if let value = textFieldInfo.rightValue {
            self.btnOfRightValue?.setTitle(value, for: .normal)
        }else {
            self.btnOfRightValue?.isHidden = true
        }
        
        self.btnOfRightValue?.isHidden = true
        
        if let value = textFieldInfo.title {
            self.lblOfTitle?.text = value
        }else {
            self.lblOfTitle?.isHidden = true
        }
        
        switch textFieldInfo.textFieldType {
        case .Amount, .Percentage:
            self.textField?.keyboardType = .decimalPad
        default:
            self.textField?.keyboardType = .default
        }
        
        self.textField?.delegate = self
        self.textField?.placeholder = textFieldInfo.placeHolder
        
//        self.layer.borderColor = UIColor.DarkGrayColor.cgColor
//        self.layer.borderWidth = 1.0
//        self.layer.cornerRadius = 8.0
    }
    
    // MARK: - Setup
    private func commonInit() {
        Bundle.main.loadNibNamed(self.nibName, owner: self, options: nil)
        contentView?.fixInView(self)
    }
    
}

extension CustomTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let textFieldType: TextFieldType = self.textFieldInfo?.textFieldType ?? .Default
        
        return self.isValidValue(textFieldType: textFieldType,
                                 textField: textField,
                                 range: range,
                                 string: string)
    }
    
    func isValidValue(textFieldType: TextFieldType,
                      textField: UITextField,
                      range: NSRange,
                      string: String) -> Bool {
        
        self.customTextFieldDelegate?.didChangeValue(textField: self)
        
        if string == "" {
            return true
        }
        
        // Handle paste or multi-character input
        let currentText = textField.text ?? ""
        guard let textRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: textRange, with: string)
        
        switch textFieldType {
        case .Amount:
            
            // Remove any non-digit characters
            let filteredText = updatedText.filter { $0.isWholeNumber }
            
            // Block leading zero
            if filteredText.first == "0" {
                return false
            }
            
            // Check numeric value limit
            if let value = UInt64(filteredText), value <= self.maxAmount {
                return true
            }
            
            // Block if not valid or exceeds max value
            return false
            
        case .Percentage:
            // Allow empty string
            if updatedText.isEmpty {
                return true
            }
            
            // Allow only digits and one decimal point
            let allowedCharacters = CharacterSet(charactersIn: "0123456789.")
            if string.rangeOfCharacter(from: allowedCharacters.inverted) != nil {
                return false
            }
            
            // Prevent multiple dots
            let dotCount = updatedText.filter { $0 == "." }.count
            if dotCount > 1 {
                return false
            }
            
            // Validate as float and within range 0...100
            if let value = Float(updatedText), value >= 0, value <= 100 {
                return true
            }
            
            return false
            
        case .Tenure, .Date, .Time, .DropDown:
            return false
            
        default:
            return true
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        self.customTextFieldDelegate?.didGetFocused(textField: self)
        
        switch self.textFieldInfo?.textFieldType {
            case .Amount,.Percentage:
                return true
            
            case .Tenure, .Date, .Time, .DropDown:
                return false
            
            default:
                return true
        }
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        self.customTextFieldDelegate?.didLostFocused(textField: self)
        
        switch self.textFieldInfo?.textFieldType {
            case .Amount,.Percentage:
                return true
            
            case .Tenure, .Date, .Time, .DropDown:
                return false
            
            default:
                return true
        }
    }
    
}
