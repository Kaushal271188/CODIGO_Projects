//
//  IntroductionInfoCell.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 13/07/25.
//

import UIKit

class IntroductionInfoCell: UICollectionViewCell {

    static let cellId = "IntroductionInfoCell"
    
    @IBOutlet weak var imgOfIntro: UIImageView!
    @IBOutlet weak var lblOfTitle: UILabel!
    @IBOutlet weak var lblOfDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func getNewCell(introInfo: IntroductionInfoModel) {
        self.imgOfIntro?.image = introInfo.imgOfIntro
        self.lblOfTitle?.text = introInfo.titleOfIntro
        self.lblOfDescription?.text = introInfo.descriptionOfIntro
    }

}
