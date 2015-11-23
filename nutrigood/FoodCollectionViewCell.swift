//
//  FoodCollectionViewCell.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/20/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
        
    @IBAction func addToCart(sender: UIButton) {
        self.addedToCart = !self.addedToCart
        if (self.addedToCart) {
            Database.addToCart(self.foodItem)
        } else {
            Database.removeFromCart(self.foodItem)
        }
        NSNotificationCenter.defaultCenter().postNotificationName(NutritionChartsViewController.PublicConstants.UpdateNutrition, object: nil)
    }
    
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    
    var foodItem:FoodItem! {
        didSet {
            self.foodImage.image = nil
            self.nameLabel?.text = nil
            
            self.nameLabel?.text = self.foodItem.name
            self.addedToCart = self.foodItem.inCart
            if let image = self.foodItem.image {
                self.foodImage.image = image
            } else {
                self.foodImage.image = UIImage(named: "testImage")!
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)) {
                    if let url = FoodItem.getImageURLFromFlickrWithSearchQuery(self.foodItem.name) {
                        if let data = NSData(contentsOfURL: url) {
                            dispatch_async(dispatch_get_main_queue()){
                                let flickrImage = UIImage(data: data)
                                self.foodImage.image = flickrImage
                                self.foodItem.image = flickrImage
                            }
                        }
                    }
                }
            }
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
            } else {
                // Change button to a plus sign
                self.addItemButton.setImage(UIImage(named: "plus"), forState: .Normal)
            }
        }
    }

}
