//
//  CurrencyListTableView.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 09/07/25.
//

import UIKit

class CurrencyListTableView: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var viewModel = CurrencyListViewModel()
    
    var arrayOfCurrenyList: [CurrencyListModel]?
    
    //Closure action of select Language
    var didSelectCurrency: ((_ selectedInfo: CurrencyListModel) -> Void)? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTableViewFormate()
        self.arrayOfCurrenyList = self.viewModel.arrayOfCurrenyList?.sorted(by: {$0.name < $1.name})
     }

}

extension CurrencyListTableView: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableViewFormate() {
        
        self.setupView(arrayOfCellIDs: [CurrencyLanguageInfoCell.cellId])
        self.delegate = self
        self.dataSource = self
        
        self.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfCurrenyList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyLanguageInfoCell.cellId, for: indexPath) as! CurrencyLanguageInfoCell
        
        if let currentInfo = self.arrayOfCurrenyList?[indexPath.row] {
            let selectedInfo = self.viewModel.selectedCurrency
            cell.getNewCell(currentInfo: currentInfo, selectedInfo: selectedInfo)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if var currencyInfo = self.arrayOfCurrenyList?[indexPath.row] {
            
//            var isAlreadySelected: Bool = false
            
//            if let selectedLanguageInfo = self.viewModel.selectedCurrency {
//                isAlreadySelected = (selectedLanguageInfo.currency.code.lowercased() == currencyInfo.currency.code.lowercased())
//            }
            
            if currencyInfo.isSelected.count == 0 {
                currencyInfo.isSelected = "1"
            }
            self.viewModel.saveCurrencyInfo(selectedCurrency: currencyInfo)
            
            
//            if isAlreadySelected == false {
//                self.viewModel.saveCurrencyInfo(selectedCurrency: currencyInfo)
//            }
            
            if let didSelectCurrency = self.didSelectCurrency {
                didSelectCurrency(currencyInfo)
            }
            
            self.reloadCurrentData()
        }
    }
    
}

