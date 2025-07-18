//
//  IntroductionVC.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 13/07/25.
//

import UIKit

class IntroductionVC: UIViewController {
    
    @IBOutlet weak var collectionViewOfIntroduction: CollectionViewOfIntroduction!
    
    @IBOutlet weak var btnOfNext: UIButton!
    @IBOutlet weak var btnOfPrevious: UIButton!
    
    @IBOutlet weak var btnOfSkip: UIButton!
    
    @IBOutlet weak var pageController: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setViewFormate()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension IntroductionVC {
    
    func setViewFormate() {
        
        self.pageController?.numberOfPages = self.collectionViewOfIntroduction?.arrayOfIntroductionInfo.count ?? 0
        self.manageButtonFormate(currentPage: 0)
        
        self.collectionViewOfIntroduction?.isScrollEnabled = false
        
        self.collectionViewOfIntroduction?.didVisibleCell = { currentPage in
            DispatchQueue.main.async {
                self.manageButtonFormate(currentPage: currentPage)
            }
        }
        
    }
    
}

extension IntroductionVC {
    
    @IBAction func btnOfNextAndPreviouseAction(_ btn: UIButton) {
        
        var currentPage = self.pageController?.currentPage ?? 0
        
        if btn == self.btnOfNext {
            currentPage += 1
            if currentPage >= ((self.collectionViewOfIntroduction?.arrayOfIntroductionInfo.count ?? 0) - 1) {
                currentPage = ((self.collectionViewOfIntroduction?.arrayOfIntroductionInfo.count ?? 0) - 1)
            }
        }
        
        if btn == self.btnOfPrevious {
            currentPage -= 1
            if currentPage <= 0 {
                currentPage = 0
            }
        }
        
        self.manageButtonFormate(currentPage: currentPage)
        
        let indexPath = IndexPath(item: currentPage, section: 0)
        self.collectionViewOfIntroduction?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    func manageButtonFormate(currentPage: Int) {
        
        DispatchQueue.main.async {
            self.btnOfNext?.isEnabled = false
            self.btnOfPrevious?.isEnabled = false
            
            if currentPage >= 1 {
                self.btnOfPrevious?.isEnabled = true
            }
            
            if currentPage < ((self.collectionViewOfIntroduction?.arrayOfIntroductionInfo.count ?? 0) - 1) {
                self.btnOfNext?.isEnabled = true
            }
            
            self.pageController?.currentPage = currentPage
        }
    }
    
    @IBAction func btnOfSkipAction() {
        let vc = UIStoryboard.instantiateViewController(storyBorad: .Authentication, controller: .CurrencyListVC)
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
}
