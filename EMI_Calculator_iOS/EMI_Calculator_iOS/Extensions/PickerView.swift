//
//  PickerView.swift
//  EMI_Calculator_iOS
//
//  Created by Kishan Monpara on 18/07/25.
//

import UIKit

class SingleComponentPicker: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private var items: [String] = []
    private weak var pickerView: UIPickerView?
    private var selectedIndex: Int = 0

    init(pickerView: UIPickerView, items: [String], preselectedIndex: Int = 0) {
        super.init()
        self.pickerView = pickerView
        self.items = items
        self.selectedIndex = preselectedIndex < items.count ? preselectedIndex : 0

        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(self.selectedIndex, inComponent: 0, animated: false)
    }

    // MARK: - Public API

    func getSelectedValue() -> String? {
        return items.indices.contains(selectedIndex) ? items[selectedIndex] : nil
    }

    func setSelectedIndex(_ index: Int, animated: Bool = false) {
        guard items.indices.contains(index) else { return }
        selectedIndex = index
        pickerView?.selectRow(index, inComponent: 0, animated: animated)
    }

    func updateItems(_ newItems: [String], preselect index: Int = 0) {
        self.items = newItems
        self.selectedIndex = index < newItems.count ? index : 0
        pickerView?.reloadAllComponents()
        pickerView?.selectRow(self.selectedIndex, inComponent: 0, animated: false)
    }

    // MARK: - UIPickerView DataSource

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }

    // MARK: - UIPickerView Delegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
}
