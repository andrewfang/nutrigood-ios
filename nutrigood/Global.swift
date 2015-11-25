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
    static let UserDefaultCarb = "UserDefaultCarbKey"
    static let UserDefaultProtein = "UserDefaultProteinKey"
    static let UserDefaultFats = "UserDefaultFatKey"
    static let UserDefaultCalories = "UserDefaultCalKey"
    static let AllergenDict = [
        "pork":"🐷",
        "beef":"🐮",
        "meat":"🍖",
        "poultry":"🐔",
        "nuts":"🌰",
        "dairy":"🧀",
        "gluten":"🍞",
    ]
}

class Profile {
    static var carbs:Double {
        get {
            let userDefault = NSUserDefaults.standardUserDefaults()
            let setDefault = userDefault.doubleForKey(PublicConstants.UserDefaultCarb)
            if (setDefault < 1) {
                return 310.0
            }
            return setDefault
        } set {
            let userDefault = NSUserDefaults.standardUserDefaults()
            userDefault.setDouble(newValue, forKey: PublicConstants.UserDefaultCarb)
        }
    }
    
    static var fats:Double {
        get {
            let userDefault = NSUserDefaults.standardUserDefaults()
            let setDefault = userDefault.doubleForKey(PublicConstants.UserDefaultFats)
            if (setDefault < 1) {
                return 65.0
            }
            return setDefault
        } set {
            let userDefault = NSUserDefaults.standardUserDefaults()
            userDefault.setDouble(newValue, forKey: PublicConstants.UserDefaultFats)
        }
    }
    
    static var protein:Double {
        get {
            let userDefault = NSUserDefaults.standardUserDefaults()
            let setDefault = userDefault.doubleForKey(PublicConstants.UserDefaultProtein)
            if (setDefault < 1) {
                return 56.0
            }
            return setDefault
        } set {
            let userDefault = NSUserDefaults.standardUserDefaults()
            userDefault.setDouble(newValue, forKey: PublicConstants.UserDefaultProtein)
        }
    }
    
    static var calories:Int {
        get {
            let userDefault = NSUserDefaults.standardUserDefaults()
            let setDefault = userDefault.integerForKey(PublicConstants.UserDefaultCalories)
            if (setDefault < 1) {
                return 2500
            }
            return setDefault
        } set {
            let userDefault = NSUserDefaults.standardUserDefaults()
            userDefault.setInteger(newValue, forKey: PublicConstants.UserDefaultCalories)
        }
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