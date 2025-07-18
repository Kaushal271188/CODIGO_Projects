//
//  ToolOptionInfoCell.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 14/07/25.
//

import UIKit

class ToolOptionInfoCell: UITableViewCell {
    
    static let cellId = "ToolOptionInfoCell"
    
    @IBOutlet weak var parentView: UIView!
    
    @IBOutlet weak var lblOfTitle: UILabel!
    @IBOutlet weak var lblOfDescripton: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getNewCell(optionInfo: ToolsOptionsModel) {
        self.lblOfTitle?.text = optionInfo.optionTitle
        self.lblOfDescripton?.text = optionInfo.optionDescription
        
        self.parentView?.layer.borderColor = UIColor.lightGray.cgColor
        self.parentView?.layer.borderWidth = 0.5
        self.parentView?.layer.cornerRadius = 10.0
        
    }
    
}
