//
//  TableViewInfoCell.swift
//  nutrigood
//
//  Created by Jorge Garcia Mesa on 11/19/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class TableViewInfoCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var infoLabel: UILabel!
//    @IBOutlet weak var ValueLabel: UILabel!
    @IBOutlet weak var infoPicker: UIPickerView!
    
    var pickerTitles:[String]!
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerTitles.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerTitles[row]
    }
}
