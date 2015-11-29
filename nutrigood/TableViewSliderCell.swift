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
        let currentValue = Int(sender.value)
        self.AmountLabel.text = "\(currentValue)"

        guard let intakeType = self.IntakeLabel.text else {
            return
        }
        
        switch(intakeType) {
        case PublicConstants.UserDefaultCalories:
            Profile.calories = Int(sender.value)
        case PublicConstants.UserDefaultCarb:
            Profile.carbs = Double(sender.value)
        case PublicConstants.UserDefaultFats:
            Profile.fats = Double(sender.value)
        case PublicConstants.UserDefaultProtein:
            Profile.protein = Double(sender.value)
        default:
            break
        }
    }
    
}
