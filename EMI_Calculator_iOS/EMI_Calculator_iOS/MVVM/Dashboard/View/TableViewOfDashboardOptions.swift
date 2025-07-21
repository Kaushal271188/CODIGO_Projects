//
//  TableViewOfDashboardOptions.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 21/07/25.
//

import UIKit

class TableViewOfDashboardOptions: UITableView {

    
    var viewModel = DashboardViewModel()
    
    //Closure action of selected option
    var didSelectOption: ((_ selectedOption: DashboardModel) -> Void)? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTableViewFormate()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension TableViewOfDashboardOptions: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableViewFormate() {
        
        self.setupView(arrayOfCellIDs: [DashboardOptionInfoCell.cellId])
        self.delegate = self
        self.dataSource = self
        
        self.separatorStyle = .none
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.arrayOfOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DashboardOptionInfoCell.cellId, for: indexPath) as! DashboardOptionInfoCell
        
        let objInfo = self.viewModel.arrayOfOptions[indexPath.row]
        var celInfo = DashboardOptionInfoCell.CellInfo(title: objInfo.optionTitle, icon: objInfo.optionIcon)
        cell.getNewCell(objOfInfo: celInfo)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let objInfo = self.viewModel.arrayOfOptions[indexPath.row]
        
        //Do some logic here
        if let didSelectOption = self.didSelectOption {
            didSelectOption(objInfo)
            self.reloadCurrentData()
        }else {
            self.reloadCurrentData()
        }
        
    }
    
}
