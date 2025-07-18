//
//  TableViewOfLeftMenu.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 10/07/25.
//

import UIKit

class TableViewOfLeftMenu: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var viewModel = LeftMenuViewModel()
    
    var arrayOfOptions: [LeftMenuModel]?
    
    //Closure action of select Language
    var didSelectOption: ((_ leftMenuOpton: LeftMenuModel) -> Void)? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTableViewFormate()
    }
}

extension TableViewOfLeftMenu: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableViewFormate() {
        
        self.setupView(arrayOfCellIDs: [LeftMenuCell.cellId])
        self.delegate = self
        self.dataSource = self
        
        self.separatorStyle = .none
        
//        self.viewModel.selectedLanguage
        
        self.arrayOfOptions = self.viewModel.arrayOfOptions
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfOptions?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: LeftMenuCell.cellId, for: indexPath) as! LeftMenuCell
        
        if let languageInfo = self.arrayOfOptions?[indexPath.row] {
            cell.getNewCell(menuInfo: languageInfo)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let languageInfo = self.arrayOfOptions?[indexPath.row] {
            if let didSelectOption = self.didSelectOption {
                didSelectOption(languageInfo)
            }
        }
    }
    
}
