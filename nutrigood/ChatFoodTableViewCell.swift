//
//  ChatFoodTableViewCell.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/24/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class ChatFoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var addToCartButton: UIButton!
    
    var foodItem:FoodItem! {
        didSet {
            self.foodName.text = self.foodItem.name
            if (self.foodItem.image != nil) {
                self.foodImage.image = self.foodItem.image
            } else {
                self.foodImage.image = UIImage(named: "testImage")!
                let name = self.foodItem.name
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)) {
                    if let url = FoodItem.getImageURLFromFlickrWithSearchQuery(self.foodItem.name) {
                        if let data = NSData(contentsOfURL: url) {
                            dispatch_async(dispatch_get_main_queue()){
                                if (name == self.foodItem.name) {
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
    }
    
    @IBAction func addtoCart(sender:UIButton) {
        if (self.foodItem.inCart) {
            self.addToCartButton.setImage(UIImage(named: "plus"), forState: .Normal)
            Database.removeFromCart(self.foodItem)
        } else {
            self.addToCartButton.setImage(UIImage(named: "check"), forState: .Normal)
            Database.addToCart(self.foodItem)
        }
        NSNotificationCenter.defaultCenter().postNotificationName(PublicConstants.UpdateNutrition, object: nil)
    }

}
