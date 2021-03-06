//
//  TableViewSwitchCell.swift
//  nutrigood
//
//  Created by Jorge Garcia Mesa on 11/19/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class TableViewSwitchCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var SwitchLabel: UILabel!
    @IBOutlet weak var RestrictionsSwitch: UISwitch! {
        didSet {
            self.RestrictionsSwitch.addTarget(self, action: "switchValueChanged:", forControlEvents: .ValueChanged)
        }
    }
    
    func switchValueChanged(uiswitch:UISwitch) {
        if let label = self.SwitchLabel.text {
            NSUserDefaults.standardUserDefaults().setBool(self.RestrictionsSwitch.on, forKey: label)
        }
    }
}
