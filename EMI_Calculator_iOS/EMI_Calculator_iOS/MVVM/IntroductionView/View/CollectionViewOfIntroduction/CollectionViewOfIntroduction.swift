//
//  CollectionViewOfIntroduction.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 13/07/25.
//

import UIKit

class CollectionViewOfIntroduction: UICollectionView {
    
    var viewModel = IntroductionViewModel()
    var arrayOfIntroductionInfo = [IntroductionInfoModel]()
    
    var didVisibleCell: ((_ : Int) -> Void)? = nil
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupCollectionViewFormate()
    }
    
}


extension CollectionViewOfIntroduction: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private func setupCollectionViewFormate() {
        
        //Setup collection view flow layoput
        let cellWidth = self.frame.size.width
        let cellHeight = self.frame.size.height
        
        var collectionViewFormate = CustomCollectionViewFormate()
        collectionViewFormate.itemHeight = cellHeight
        collectionViewFormate.itemWidth = cellWidth
        collectionViewFormate.scrollDirection = .horizontal
        self.flowlayoutFormate(customCollectionViewFormate: collectionViewFormate)
        
        
        
        //Get the list of an introduction objects
        self.arrayOfIntroductionInfo = self.viewModel.arrayOfIntroductionInfo
//        self.cellIdentifier = IntroductionInfoCell.cellId
        
        let collectionVie = CollectionItem(cell: IntroductionInfoCell.self, cellIdentifier: IntroductionInfoCell.cellId)
        
        self.setupView(arrayOfCell: [collectionVie])
        self.isPagingEnabled = true
        
        //Set collection view cell
        self.collectionViewDelegate = self
        
        self.delegate = self
        self.dataSource = self
        
//        self.reloadCurrentData()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.arrayOfIntroductionInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroductionInfoCell.cellId, for: indexPath) as! IntroductionInfoCell
        
        let introInfo = self.arrayOfIntroductionInfo[indexPath.item]
        cell.getNewCell(introInfo: introInfo)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = self.frame.size.width
        let cellHeight = self.frame.size.height
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
}

extension CollectionViewOfIntroduction: CollectionViewDelegate {
    func currentVisibleCells(collectionView: UICollectionView, visibleCells: [UICollectionViewCell], visibleIndexPah: [IndexPath]) {
        if let didVisibleCell = self.didVisibleCell {
            didVisibleCell(visibleIndexPah.first?.item ?? 0)
        }
    }
}
