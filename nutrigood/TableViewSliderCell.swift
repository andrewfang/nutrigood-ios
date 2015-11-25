//
//  TableViewSliderCell.swift
//  nutrigood
//
//  Created by Jorge Garcia Mesa on 11/19/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class TableViewSliderCell: UITableViewCell{

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var IntakeLabel: UILabel!
    @IBOutlet weak var IntakeSlider: UISlider!
    @IBOutlet weak var AmountLabel: UILabel!
    var name:String!
    
    @IBAction func SliderValueChange(sender: UISlider) {
        var currentValue = Int(sender.value)
        self.AmountLabel.text = "\(currentValue)"

//        NSUserDefaults.standardUserDefaults().setFloat(sender.value, forKey: name)
    }
    
}
