//
//  Global.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/22/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import Foundation
import UIKit

struct PublicConstants {
    static let CartUpdated = "CartUpdated"
    static let UpdateNutrition = "UpdateNutritionNotif"
    static let NutritionDataKey = "NutritionDataKey"
    static let Protein = "protein"
    static let Carbs = "carbs"
    static let Fats = "fats"
    static let Calories = "calories"
    static let Date = "date"
}

class NutritionData: AnyObject {
    var protein:Double!
    var carbs:Double!
    var fats:Double!
    var calories:Int!
    var date:NSDate!
    
    init(protein:Double, carbs:Double, fats:Double, calories:Int, date:NSDate) {
        self.protein = protein
        self.carbs = carbs
        self.fats = fats
        self.calories = calories
        self.date = date
    }
}

// Generalizeable Alert
extension UIAlertController {
    static func makeSimpleAlert(title:String, message:String, actionText:String) -> UIAlertController{
        let alertController = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: actionText,
            style: .Default,
            handler: nil)
        alertController.addAction(defaultAction)
        return alertController
    }
}