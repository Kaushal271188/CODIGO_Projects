//
//  TableViewOfLanguageList.swift
//  EMI_Calculator_iOS
//
//  Created by Kaushal Prajapati on 05/07/25.
//

import UIKit

class TableViewOfLanguageList: UITableView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var viewModel = LanguageListViewModel()
    
    var languageList: [LanguageListModel]?
    
    //Closure action of select Language
    var didSelectLanguage: ((_ selectedLangauge: LanguageListModel) -> Void)? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupTableViewFormate()
    }
}

extension TableViewOfLanguageList: UITableViewDelegate, UITableViewDataSource {
    
    private func setupTableViewFormate() {
        
        self.setupView(arrayOfCellIDs: [CountryLanguageInfoCell.cellId])
        self.delegate = self
        self.dataSource = self
        
        self.separatorStyle = .none
        
        self.languageList = self.viewModel.languageList
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.languageList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryLanguageInfoCell.cellId, for: indexPath) as! CountryLanguageInfoCell
        
        if let languageInfo = self.languageList?[indexPath.row] {
            let selectedLanguageInfo = self.viewModel.selectedLanguage
            cell.getNewCell(currentInfo: languageInfo, selectedInfo: selectedLanguageInfo)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if var languageInfo = self.languageList?[indexPath.row] {
            
            var isAlreadySelected: Bool = false
            
            if let selectedLanguageInfo = self.viewModel.selectedLanguage {
                isAlreadySelected = (selectedLanguageInfo.code.lowercased() == languageInfo.code.lowercased()) && (selectedLanguageInfo.name.lowercased() == languageInfo.name.lowercased())
            }
            
//            if languageInfo..count == 0 {
//                languageInfo.selected = "1"
//            }
//            self.viewModel.saveLanguageInfo(selectedLanguage: languageInfo)
            
            
            if isAlreadySelected == false {
                self.viewModel.saveLanguageInfo(selectedLanguage: languageInfo) { isSuccess in
                    //Do some logic here
                    if let didSelectLanguage = self.didSelectLanguage {
                        didSelectLanguage(languageInfo)
                        self.reloadCurrentData()
                    }else {
                        self.reloadCurrentData()
                    }
                }
            }else {
                if let didSelectLanguage = self.didSelectLanguage {
                    didSelectLanguage(languageInfo)
                    self.reloadCurrentData()
                }else {
                    self.reloadCurrentData()
                }
            }
        }
    }
    
}
