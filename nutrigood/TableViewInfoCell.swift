//
//  TableViewInfoCell.swift
//  nutrigood
//
//  Created by Jorge Garcia Mesa on 11/19/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class TableViewInfoCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var InfoLabel: UILabel!
//    @IBOutlet weak var ValueLabel: UILabel!
    @IBOutlet weak var infoPicker: UIPickerView!
}
