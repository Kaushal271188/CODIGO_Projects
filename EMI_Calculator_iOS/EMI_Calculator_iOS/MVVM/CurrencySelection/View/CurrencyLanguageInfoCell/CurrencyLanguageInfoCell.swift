//
//  CountryLanguageInfoCell.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 23/05/25.
//

import UIKit

class CurrencyLanguageInfoCell: UITableViewCell {
    
    static let cellId = "CurrencyLanguageInfoCell"
    
    @IBOutlet weak var parentView: UIView!
    
    @IBOutlet weak var lblOfTitle: UILabel!
    
    @IBOutlet weak var lblOfCurrency: UILabel!
    
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
    
    func getNewCell(currentInfo: CurrencyListModel,
                    selectedInfo: CurrencyListModel? = nil) {
        
        self.lblOfTitle?.text = currentInfo.currency.name + " " + "(\(currentInfo.currency.code))"
        self.lblOfCurrency?.text = currentInfo.currency.symbol
        
//        let flag = currentInfo.flageBaseURL + currentInfo.code + ".svg"
        
//        let height = ((self.imgOfCountryFlag?.frame.size.height ?? 0.0) * 1.5)
//        let newSize = CGSize(width: height, height: height)
//        self.imgOfCountryFlag?.getImage(fromURL: flag,
//                                        placeHolderImage: UIImage.getCustomImage(image: .AppLogo),
//                                        size: newSize)
        
        var selectedImage = UIImage.getSystemImage(image: .UnChecked)
        
        if let selectedInfo = selectedInfo {
            
            if (selectedInfo.name.lowercased() == currentInfo.name.lowercased()) &&
                (selectedInfo.region.lowercased() == currentInfo.region.lowercased()) {
                selectedImage = (selectedInfo.region.lowercased() == currentInfo.region.lowercased()) ? UIImage.getSystemImage(image: .Checked) : UIImage.getSystemImage(image: .UnChecked)
            }
            
        }
        
        self.imgOfCheckMark?.image = selectedImage
        
    }
    
}
