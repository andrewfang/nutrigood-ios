//
//  FoodTableViewCell.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/12/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBAction func addToCart(sender: UIButton) {
        self.addedToCart = !self.addedToCart
    }

    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    var foodItem:FoodItem! {
        didSet {
            self.nameLabel?.text = self.foodItem.name
            self.imageView?.image = self.foodItem.image
            self.addedToCart = self.foodItem.inCart
        }
    }
    
    var addedToCart:Bool {
        get {
            return self.foodItem.inCart
        }
        set {
            self.foodItem.inCart = newValue
            if (newValue) {
                // Change button to a check mark
                self.addItemButton.setImage(UIImage(named:"check"), forState: .Normal)
                Database.addToCart(self.foodItem)
            } else {
                // Change button to a plus sign
                self.addItemButton.setImage(UIImage(named: "plus"), forState: .Normal)
                Database.removeFromCart(self.foodItem)
            }
        }
    }

}
