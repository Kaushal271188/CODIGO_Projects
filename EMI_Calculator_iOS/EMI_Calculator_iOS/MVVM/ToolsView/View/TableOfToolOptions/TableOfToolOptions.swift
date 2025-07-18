//
//  TableOfToolOptions.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 14/07/25.
//

import UIKit

class TableOfToolOptions: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var viewModel = ToolsOptionsViewModel()
    
    var arrayOfOptions: [ToolsOptionsModel]?
    
    //Closure action of select Language
    var didSelectOption: ((_ leftOption: ToolsOptionsModel) -> Void)? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTableViewFormate()
    }
}

extension TableOfToolOptions: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableViewFormate() {
        
        self.setupView(arrayOfCellIDs: [ToolOptionInfoCell.cellId])
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ToolOptionInfoCell.cellId, for: indexPath) as! ToolOptionInfoCell
        
        if let optionInfo = self.arrayOfOptions?[indexPath.row] {
            cell.getNewCell(optionInfo: optionInfo)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let optionInfo = self.arrayOfOptions?[indexPath.row] {
            if let didSelectOption = self.didSelectOption {
                didSelectOption(optionInfo)
            }
        }
    }
    
}

