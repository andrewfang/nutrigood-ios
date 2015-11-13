//
//  FoodDetailsViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/12/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class FoodDetailsViewController: UIViewController {

    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var calorieCount: UILabel!
    @IBOutlet weak var fatContent: UILabel!
    @IBOutlet weak var carbContent: UILabel!
    
    var item: FoodItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the item
        self.title = self.item.name
        self.foodImage.image = self.item.image
        self.calorieCount.text = "\(self.item.calories)"
        self.fatContent.text = "\(self.item.fats)"
        self.carbContent.text = "\(self.item.carbs)"
    }

}
