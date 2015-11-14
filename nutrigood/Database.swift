//
//  Database.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/12/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import Foundation

class Database {
    // TODO: Fill these in with manually created FoodItems
    static var breakfasts:[FoodItem] = [
        FoodItem(name: "Eggs", cals: 2, fats: 2, carbs: 3, favs: 3, category: CollectionNames.Breakfast),
        FoodItem(name: "Pancakes", cals: 2, fats: 2, carbs: 3, favs: 3, category: CollectionNames.Breakfast),
    ]
    static var lunches:[FoodItem] = [
        FoodItem(name: "Chicken Sandwich", cals: 2, fats: 2, carbs: 3, favs: 3, category: CollectionNames.Lunch),
        FoodItem(name: "Pasta", cals: 2, fats: 2, carbs: 3, favs: 3, category: CollectionNames.Lunch),
    ]
    static var dinners:[FoodItem] = [
        FoodItem(name: "Pulled Pork", cals: 2, fats: 2, carbs: 3, favs: 3, category: CollectionNames.Dinner),
        FoodItem(name: "Chicken Thighs", cals: 2, fats: 2, carbs: 3, favs: 3, category: CollectionNames.Dinner),
    ]
    
    static var tips:[String] = [
        "Eat more protein to get strong",
        "Not all fats are bad for you. In fact, transfats are the only things that suck. You see, the word trans comes from transit, which is bad.",
    ]
    
    static var defaultResponse:[String] = [
        "I see",
        "Okay",
        "That's nice",
        "I don't care",
        "kk",
        "sure",
        "swag",
        "f'sho",
    ]
    
    // MARK: Tip stuff
    static func getRandomTip(buttonTitle:String) -> String {
        if buttonTitle.hasPrefix("Give") {
            let idx = Int(arc4random_uniform(UInt32(tips.count)))
            return tips[idx]
        } else {
            let idx = Int(arc4random_uniform(UInt32(defaultResponse.count)))
            return defaultResponse[idx]
        }
        
    }
    
    // MARK: Food stuff
    static func addToCart(food:FoodItem) {
        Database.cart[food.category]?.append(food)
        food.inCart = true
    }
    
    static func removeFromCart(food:FoodItem) {
        var removeIndex = -1
        for (index, item) in (Database.cart[food.category]?.enumerate())! {
            if (item.name == food.name && item.calories == food.calories) {
                removeIndex = index
                break
            }
        }
        if (removeIndex >= 0) {
            Database.cart[food.category]?.removeAtIndex(removeIndex)
            food.inCart = false
        }
    }
    
    struct CollectionNames {
        static let Recents = "Recents"
        static let Favorites = "Favorites"
        static let Breakfast = "Breakfast"
        static let Lunch = "Lunch"
        static let Dinner = "Dinner"
    }
    
    // To store user state
    static var favorites:[FoodItem] = []
    static var recents:[FoodItem] = []
    static var cart:[String:[FoodItem]] = ["Breakfast":[], "Lunch":[], "Dinner":[]]
}