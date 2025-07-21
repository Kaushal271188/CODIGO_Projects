//
//  DashboardOptionInfoCell.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import UIKit

class DashboardOptionInfoCell: UITableViewCell {

    static let cellId = "DashboardOptionInfoCell"
    
    struct CellInfo {
        var title: String
        var icon: UIImage?
    }
    
    @IBOutlet weak var parentViewOfOption: UIView!
    @IBOutlet weak var lblOfOptionTitle: UILabel!
    @IBOutlet weak var imgOfOptionIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getNewCell(objOfInfo: CellInfo) {
        self.parentViewOfOption?.layer.borderWidth = 1.0
        self.parentViewOfOption?.layer.borderColor = UIColor.lightGray.cgColor
        self.parentViewOfOption?.layer.cornerRadius = 10.0
        
        self.lblOfOptionTitle?.text = objOfInfo.title
        self.imgOfOptionIcon?.image = objOfInfo.icon
    }
    
}
