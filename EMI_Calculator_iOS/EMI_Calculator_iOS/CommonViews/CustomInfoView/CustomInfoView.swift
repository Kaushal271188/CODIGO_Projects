//
//  CustomTextField.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import UIKit

class CustomInfoView: UIView {
    
    private let nibName = "CustomInfoView"

    struct CustomInfo {
        var title: String? = nil
        var value: String? = nil
    }
    
    var customInfo: CustomInfo? = nil
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var lblOfTitle: UILabel!
    @IBOutlet private weak var lblOfValue: UILabel!
    
    // MARK: - Public Closures for Set and Get
    lazy var setInfoValue: (String) -> Void = { [weak self] value in
        self?.lblOfValue?.text = value
    }
    
    lazy var getText: () -> String? = { [weak self] in
        return self?.lblOfValue?.text
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
        
        guard let customInfo = customInfo else {
            return
        }
        
        if let value = customInfo.title {
            self.lblOfTitle?.text = value
        }else {
            self.lblOfTitle?.isHidden = true
        }
        
        if let value = customInfo.value {
            self.lblOfValue?.text = value
        }else {
            self.lblOfTitle?.isHidden = true
        }
        
        
        
    }
    
    // MARK: - Setup
    private func commonInit() {
        Bundle.main.loadNibNamed(self.nibName, owner: self, options: nil)
        contentView?.fixInView(self)
    }
    
}
