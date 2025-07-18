//
//  LeftMenuCell.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 10/07/25.
//

import UIKit

class LeftMenuCell: UITableViewCell {
    
    static let cellId = "LeftMenuCell"
    
    @IBOutlet weak var parentView: UIView!
    
    @IBOutlet weak var lblOfTitle: UILabel!
    @IBOutlet weak var imgOfOption: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getNewCell(menuInfo: LeftMenuModel) {
        self.lblOfTitle?.text = menuInfo.optionTitle
        self.imgOfOption?.image = menuInfo.optionIcon
    }
    
}
