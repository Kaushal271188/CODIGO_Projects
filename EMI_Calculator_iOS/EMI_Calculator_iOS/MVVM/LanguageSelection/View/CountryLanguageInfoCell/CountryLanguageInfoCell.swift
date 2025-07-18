//
//  CountryLanguageInfoCell.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 23/05/25.
//

import UIKit

class CountryLanguageInfoCell: UITableViewCell {
    
    static let cellId = "CountryLanguageInfoCell"
    
    @IBOutlet weak var parentView: UIView!
    
    @IBOutlet weak var lblOfTitle: UILabel!
    @IBOutlet weak var lblOfSubtitle: UILabel!
    @IBOutlet weak var imgOfCountryFlag: UIImageView!
    @IBOutlet weak var imgOfCheckMark: UIImageView!
    
    var isCountrySelected: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setViewFormate()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setViewFormate() {
        self.setImageFormate(img: self.imgOfCountryFlag)
//        self.setImageFormate(img: self.imgOfCheckMark)
        
        self.parentView?.layer.borderColor = UIColor.black.cgColor
        self.parentView?.layer.borderWidth = 0.5
        self.parentView?.layer.cornerRadius = 10.0
    }
    
    func setImageFormate(img: UIImageView?) {
        DispatchQueue.main.async {
            img?.layer.cornerRadius = ((img?.frame.size.width ?? 0.0) * 0.5)
            img?.clipsToBounds = true
            img?.layer.borderColor = UIColor.black.cgColor
            img?.layer.borderWidth = 1.0
        }
    }
    
    func getNewCell(currentInfo: LanguageListModel,
                    selectedInfo: LanguageListModel? = nil) {
        
        self.lblOfTitle?.text = currentInfo.name
        self.lblOfSubtitle?.text = currentInfo.nativeName
        
//        let flag = countryInfo.flageBaseURL + countryInfo.code + ".svg"
        
        let height = ((self.imgOfCountryFlag?.frame.size.height ?? 0.0) * 1.5)
        let newSize = CGSize(width: height, height: height)
//        self.imgOfCountryFlag?.getImage(fromURL: flag,
//                                        placeHolderImage: UIImage.getCustomImage(image: .AppLogo),
//                                        size: newSize)
        
        var selectedImage = UIImage.getSystemImage(image: .UnChecked)
        
        if let selectedInfo = selectedInfo {
            selectedImage = (selectedInfo.code.lowercased() == currentInfo.code.lowercased()) ? UIImage.getSystemImage(image: .Checked) : UIImage.getSystemImage(image: .UnChecked)
        }
        
        self.imgOfCheckMark?.image = selectedImage
        
    }
    
}
