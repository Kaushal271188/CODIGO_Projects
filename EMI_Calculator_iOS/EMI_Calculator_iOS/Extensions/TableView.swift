//
//  TableView.swift
//  RockStar-iOS_SHRIMAY
//
//  Created by Kaushal Prajapati on 23/05/25.
//

import Foundation
import UIKit

private var cellIdentifierKey: UInt8 = 0

extension UITableView/*: CustomScrollViewDelegate */{
    
//    var didGetHeaderAlpha: ((Float) -> Void)? {
//        get {
//            nil
//        }
//
//        set {
//
//        }
//    }
    
    //Cell identifier
    var cellIdentifier: String? {
        get {
            return objc_getAssociatedObject(self, &cellIdentifierKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &cellIdentifierKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    
    var customScrollDelegate: CustomScrollViewDelegate? {
       return nil
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
    }
    
    
    func setupView(arrayOfCellIDs: [String]? = nil,
                   arrayOfHeaderCellIDs: [String]? = nil,
                   arrayOfFooterCellIDs: [String]? = nil,
                   weakSelf: UITableView? = nil) {
        
        if let arrayOfCellIDs = arrayOfCellIDs {
            for cellID in arrayOfCellIDs {
                self.register(UINib(nibName: cellID,
                                    bundle: nil),
                              forCellReuseIdentifier: cellID)
            }
        }
        
        if let arrayOfHeaderCellIDs = arrayOfHeaderCellIDs {
            for cellID in arrayOfHeaderCellIDs {
                self.register(UINib(nibName: cellID,
                                    bundle: nil),
                              forCellReuseIdentifier: cellID)
            }
        }
        
        if let arrayOfFooterCellIDs = arrayOfFooterCellIDs {
            for cellID in arrayOfFooterCellIDs {
                self.register(UINib(nibName: cellID,
                                    bundle: nil),
                              forCellReuseIdentifier: cellID)
            }
        }
        
        self.estimatedRowHeight = 20.0
        self.rowHeight = UITableView.automaticDimension
        
    }
    
    func reloadCurrentData() {
        let contentOffset = self.contentOffset
        DispatchQueue.main.async {
            self.reloadData()
            self.layoutIfNeeded() // Ensure layout is applied before restoring offset
            self.setContentOffset(contentOffset, animated: false)
        }
    }
    
    func scrollToMiddle(indexPath: IndexPath, tableView: UITableView, in parentView: UIView) {
        // Get the rect of the cell
        guard let cellRect = tableView.rectForRow(at: indexPath) as CGRect? else { return }
        
        // Get the cell's Y position in the table view
        let cellY = cellRect.origin.y
        
        // Calculate the target offset to center the cell in the parent view
        let targetOffsetY = cellY - (parentView.bounds.height / 2) + (cellRect.height / 2)

        // Limit offset to table content bounds
        let maxOffsetY = tableView.contentSize.height - tableView.bounds.height
        let minOffsetY: CGFloat = 0
        let finalOffsetY = max(minOffsetY, min(targetOffsetY, maxOffsetY))

        // Scroll to the calculated offset
        tableView.setContentOffset(CGPoint(x: 0, y: finalOffsetY), animated: true)
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // scrollView.contentOffset.y is how much the tableView scrolled vertically
        
        // Calculate alpha based on scroll offset
        // For example, fade out headerView as we scroll down 0 to 100 points
        let maxOffset: CGFloat = 100
        let offset = scrollView.contentOffset.y
        
        // Clamp offset between 0 and maxOffset
        let clampedOffset = max(0, min(offset, maxOffset))
        
        // Calculate alpha from 1 (at top) to 0 (at maxOffset)
        let alpha = 1 - (clampedOffset / maxOffset)
        
        if let didGetHeaderAlpha = customScrollDelegate?.didGetHeaderAlpha {
            didGetHeaderAlpha(alpha)
        }
    }
}

extension UITableViewCell {
    open override func awakeFromNib() {
        self.selectionStyle = .none
    }
}
