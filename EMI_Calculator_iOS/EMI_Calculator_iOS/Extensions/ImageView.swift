//
//  ImageView.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 22/05/25.
//

import UIKit
import SDWebImage

import SVGKit


class ImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension UIImage {
    //Name of an images which are added in the Assets
    enum ImageName: String {
        case AppLogo = "app_logo"
        
        case IntroPage1 = "intro_page_1"
        case IntroPage2 = "intro_page_2"
        case IntroPage3 = "intro_page_3"
        case IntroPage4 = "intro_page_4"
    }
    
    enum SystemImageName: String {
        case UnChecked = "circle"
        case Checked = "checkmark.circle.fill"
        
        case RemoveAds = "medal.fill"
        case AboutUs = "info.circle"
        case RateUs = "star"
        case Share = "tray.and.arrow.up"
        
        case HomeTabUnselectedIcon = "house"
        case ToolsTabUnselectedIcon = "hammer"
        case HistoryTabUnselectedIcon = "circle.grid.2x2"
        case SettingsTabUnselectedIcon = "gearshape"
        
        case HomeTabSelectedIcon = "house.fill"
        case ToolsTabSelectedIcon = "hammer.fill"
        case HistoryTabSelectedIcon = "circle.grid.2x2.fill"
        case SettingsTabSelectedIcon = "gearshape.fill"
        
        
    }
    
    static func getCustomImage(image: ImageName) -> UIImage? {
        UIImage(named: image.rawValue)
    }
    
    static func getSystemImage(image: SystemImageName) -> UIImage? {
        UIImage(systemName: image.rawValue)
    }
}

extension UIImageView {
    
    //Set the UIImageView type to template to change the image custom color.
    func setTeamplateImage(_ img : UIImage,_ imgColor : UIColor) {
        let templateImage = img.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = imgColor
    }
    
    func convertSVGToPNG(fromURL : String, placeHolderImage: UIImage?, size: CGSize? = nil) {
        
        DispatchQueue.main.async {
            let url = URL(string: fromURL)
            guard let svgImage = SVGKImage(contentsOf: url) else {
                self.contentMode = .center
                self.image = placeHolderImage
                return
            }
            
            // Optional: set size
            if let size = size {
                svgImage.size = size//CGSize(width: 200, height: 200)
            }else {
                svgImage.size = self.frame.size//CGSize(width: 200, height: 200)
            }
            
            // Render to UIImage (PNG format if saved)
            self.contentMode = .scaleAspectFill
            self.image = svgImage.uiImage
        }
    }
    
    /// Method is use to get the image from URL.
    /// - Parameters:
    ///   - fromURL: URL of image from where image will going to download.
    ///   - placeHolderImage: Place holder OR default image which will keep displaying if there is any issue while getting image from URL.
    func getImage(fromURL : String, placeHolderImage: UIImage?, size: CGSize? = nil) {
        
        guard fromURL.components(separatedBy: "/").last?.lowercased().contains(".svg") == nil else {
            self.convertSVGToPNG(fromURL: fromURL, placeHolderImage: placeHolderImage, size: size)
            return
        }
        
        self.sd_imageIndicator = SDWebImageActivityIndicator.white
        
        self.sd_setImage(with: URL(string: fromURL) , placeholderImage: placeHolderImage, options: SDWebImageOptions.delayPlaceholder) { (img, error, cacheType, tempURL) in
            
            if error == nil {
                
                if img != nil {
                    self.contentMode = .scaleAspectFill
                    self.image = img!
                }else {
                    self.contentMode = .center
                    
                    self.sd_setImage(with: tempURL!, placeholderImage: placeHolderImage, options: SDWebImageOptions.delayPlaceholder) { (tempImage, tempError, imageCache, finalURL) in
                        
                        if tempError == nil && tempImage != nil{
                            self.contentMode = .scaleAspectFill
                            self.image = tempImage
                        }else {
                            self.contentMode = .center
                            self.image = placeHolderImage!
                        }
                    }
                }
            }else {
                self.contentMode = .center
                self.image = placeHolderImage
            }
        }
        
    }
    
}
