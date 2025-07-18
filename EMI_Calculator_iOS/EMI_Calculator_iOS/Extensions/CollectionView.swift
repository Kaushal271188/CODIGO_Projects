//
//  CollectionView.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 26/06/25.
//

import Foundation
import UIKit

private var collectionViewDelegateKey: UInt8 = 0
private var cellIdentifierKey: UInt8 = 0

protocol CollectionViewDelegate {
    func currentVisibleCells(collectionView: UICollectionView,
                             visibleCells: [UICollectionViewCell],
                             visibleIndexPah: [IndexPath])
}

struct CollectionItem {
    var cell: UICollectionViewCell.Type
    var cellIdentifier: String
}

struct CollectionHeader {
    var cell: UICollectionReusableView.Type
    var cellIdentifier: String
}

struct CollectionFooter {
    var cell: UICollectionReusableView.Type
    var cellIdentifier: String
}



extension UICollectionView {
    
    //Collection view custom delegate
    var collectionViewDelegate: CollectionViewDelegate? {
        get {
            return objc_getAssociatedObject(self, &collectionViewDelegateKey) as? CollectionViewDelegate
        }
        set {
            objc_setAssociatedObject(self, &collectionViewDelegateKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    struct CustomCollectionViewFormate {
        var minimumLineSpacing: CGFloat = 0.0
        var minimumInteritemSpacing: CGFloat = 0.0
        var itemWidth: CGFloat = 30.0
        var itemHeight: CGFloat = 30.0
        var headerWidth: CGFloat = 0.0
        var headerHeight: CGFloat = 0.0
        var footerWidth: CGFloat = 0.0
        var footerHeight: CGFloat = 0.0
        var scrollDirection: UICollectionView.ScrollDirection = .vertical
        var sectionInset: UIEdgeInsets = UIEdgeInsets(top: 0.0,
                                                      left: 0.0,
                                                      bottom: 0.0,
                                                      right: 0.0)
        var sectionHeadersPinToVisibleBounds: Bool = false
        var sectionFootersPinToVisibleBounds: Bool = false
    }
    
    var customCollectionViewFormate: CustomCollectionViewFormate {
        get{return CustomCollectionViewFormate()}
        set { }
    }
    
    var customScrollDelegate: CustomScrollViewDelegate? {
       return nil
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
//        self.collectionViewLayout = self.customFlowLayout
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }
    
    func setupView(arrayOfCell: [CollectionItem]? = nil,
                   arrayOfHeader: [CollectionHeader]? = nil,
                   arrayOfFooter: [CollectionFooter]? = nil,
                   weakSelf: UICollectionView? = nil) {
        
        if let arrayOfCell = arrayOfCell {
            for cell in arrayOfCell {
//                if let identifier = cellItem.cellIdentifier {
//
//                    self.register(nib, forCellWithReuseIdentifier: self.cellIdentifier ?? "CellId")
//                }
                
                
                let nib = UINib(nibName: cell.cellIdentifier, bundle: nil)
                self.register(nib, forCellWithReuseIdentifier: cell.cellIdentifier)
                
            }
        }
        
        if let arrayOfCell = arrayOfHeader {
//            for cell in arrayOfHeader {
//                self.register(cell,
//                              forSupplementaryViewOfKind: self.cellIdentifier ?? "CellId",
//                              withReuseIdentifier: self.cellIdentifier ?? "CellId")
//            }
            
            for cell in arrayOfCell {
//                if let identifier = cellItem.cellIdentifier {
//
//                    self.register(nib, forCellWithReuseIdentifier: self.cellIdentifier ?? "CellId")
//                }
                
                
                let nib = UINib(nibName: cell.cellIdentifier, bundle: nil)
                self.register(nib,
                              forSupplementaryViewOfKind: cell.cellIdentifier,
                              withReuseIdentifier: cell.cellIdentifier)
                
                
            }
            
        }
        
        if let arrayOfCell = arrayOfFooter {
//            for cell in arrayOfFooter {
//                self.register(cell,
//                              forSupplementaryViewOfKind: self.cellIdentifier ?? "CellId",
//                              withReuseIdentifier: self.cellIdentifier ?? "CellId")
//            }
            
            
            for cell in arrayOfCell {
                let nib = UINib(nibName: cell.cellIdentifier, bundle: nil)
                self.register(nib,
                              forSupplementaryViewOfKind: cell.cellIdentifier,
                              withReuseIdentifier: cell.cellIdentifier)
                
                
            }
            
        }
        
    }
    
    func reloadCurrentData() {
        let contentOffset = self.contentOffset
        DispatchQueue.main.async {
            self.reloadData()
            self.layoutIfNeeded() // Ensure layout is applied before restoring offset
            self.setContentOffset(contentOffset, animated: false)
        }
    }
    
    
    func flowlayoutFormate(customCollectionViewFormate: CustomCollectionViewFormate) {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.minimumLineSpacing = customCollectionViewFormate.minimumLineSpacing
        flowLayout.minimumInteritemSpacing = customCollectionViewFormate.minimumInteritemSpacing
        flowLayout.sectionInset = customCollectionViewFormate.sectionInset
        
        flowLayout.itemSize = CGSize(width: customCollectionViewFormate.itemWidth,
                                     height: customCollectionViewFormate.itemHeight)
        
        flowLayout.headerReferenceSize = CGSize(width: customCollectionViewFormate.headerWidth,
                                                height: customCollectionViewFormate.headerHeight)
        
        flowLayout.footerReferenceSize = CGSize(width: customCollectionViewFormate.footerWidth,
                                                height: customCollectionViewFormate.footerHeight)
        
        
        flowLayout.sectionHeadersPinToVisibleBounds = customCollectionViewFormate.sectionHeadersPinToVisibleBounds
        flowLayout.sectionFootersPinToVisibleBounds = customCollectionViewFormate.sectionFootersPinToVisibleBounds
        
        flowLayout.scrollDirection = customCollectionViewFormate.scrollDirection
        
        self.collectionViewLayout = flowLayout
        
    }
    
}


extension UICollectionViewCell {

    //Cell identifier
    var cellIdentifier: String? {
        get {
            return objc_getAssociatedObject(self, &cellIdentifierKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &cellIdentifierKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    

}

//extension UICollectionReusableView {
//    static var CustomIdentifier: String {
//        return "CustomIdentifier"
//    }
//}

extension UICollectionView: UIScrollViewDelegate {
    
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var cells = self.visibleCells
        var arrayOfIndexPath = [IndexPath]()
        
        for cell in cells {
            if let indexPath = self.indexPath(for: cell) {
                arrayOfIndexPath.append(indexPath)
                print("Visible cell at \(indexPath)")
            }
        }
        
        self.collectionViewDelegate?.currentVisibleCells(collectionView: self,
                                                         visibleCells: cells,
                                                         visibleIndexPah: arrayOfIndexPath)
    }
    
}
