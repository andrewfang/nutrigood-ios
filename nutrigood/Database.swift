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
        FoodItem(name: "Fruit Cup", cals: 30, fats: 0.3, carbs: 7.68, protein: 0.67, allergens: [], category: CollectionNames.Breakfast),
        FoodItem(name: "Butter Toast", cals: 60, fats: 0.3, carbs: 7.68, protein: 0.67, allergens: ["gluten"], category: CollectionNames.Breakfast),
        FoodItem(name: "Cereal and Milk", cals: 50, fats: 0.3, carbs: 7.68, protein: 0.67, allergens: ["nuts", "dairy", "gluten"], category: CollectionNames.Breakfast),
    ]
    static var lunches:[FoodItem] = [
        FoodItem(name: "Bean Burrito", cals: 32, fats: 0.3, carbs: 7.68, protein: 0.67, allergens: [], category: CollectionNames.Lunch),
        FoodItem(name: "Salad", cals: 32, fats: 0.3, carbs: 7.68, protein: 0.67, allergens: [], category: CollectionNames.Lunch),
        FoodItem(name: "Ham & Cheese Sandwich", cals: 32, fats: 0.3, carbs: 7.68, protein: 0.67, allergens: ["pork", "dairy"], category: CollectionNames.Lunch),
    ]
    static var dinners:[FoodItem] = [
        FoodItem(name: "Salad", cals: 32, fats: 0.3, carbs: 7.68, protein: 0.67, allergens: [], category: CollectionNames.Dinner),
        FoodItem(name: "Venison", cals: 32, fats: 0.3, carbs: 7.68, protein: 0.67, allergens: ["meat"], category: CollectionNames.Dinner),
        FoodItem(name: "Chicken and Broccoli", cals: 32, fats: 0.3, carbs: 7.68, protein: 0.67, allergens: ["poultry"], category: CollectionNames.Dinner),
    ]
    
    static var tips:[String] = [
        "Eat more protein to get strong",
        "Not all fats are bad for you. In fact, transfats are the only things that suck. You see, the word trans comes from transit, which is bad.",
    ]
    
    static var nutritionTips:[String] = [
        "Try not to eat late at night, just before bed.",
        "It’s best for breakfast to be your largest meal, lunch to be your second largest, and dinner to be your smallest, since you will be burning energy throughout the day, and burning much less energy when you sleep!",
        "Eat smaller meals more frequently throughout the day.",
        "Lean proteins (chicken, fish, tofu) are key to building the type of healthy muscle mass that your body thrives on.",
        "In the United States, the most common dietary nutritional deficiency is Vitamin B6.  Other Vitamins (A, C, D, E, K), as well as minerals (Calcium, Magnesium, Iron) are an extremely important part of your diet, for bone, organ, muscle, skin and cell health.  Get your fix on vitamins by eating lots of fruits and vegetables.  Bran rice is great for vitamin B6.",
        "Don’t drink sugar calories!  Sugary drinks are the most fattening things you can put into your body because the liquid sugar calories don’t get registered by the brain in the same way as calories from solid foods (http://www.ncbi.nlm.nih.gov/pubmed/10878689).  Fruit juice is almost as bad as soda!",
        "Eat lots of nuts - they are loaded with key vitamins and minerals, as well as fiber (http://ndb.nal.usda.gov/ndb/foods/show/3667).  Nuts are super because they can help you lose weight, fight type 2 diabetes and heart disease.",
        "Avoid processed foods: they have been engineered to be \"hyper-rewardin,\" so they trick our brains into eating more than we need!",
        "Eating 100 less calories per day can amount to some big savings: up to 10lbs per year!",
        "If you are big on cardio, it’s important to build large energy stores with complex carbohydrates: regular pasta and rice are your friends!",
        "Want to get better results from your weightlifting sessions?  Follow-up with some chocolate milk or some of these recovery foods: http://www.outsideonline.com/1898066/top-10-recovery-foods",
        "Wait around 2 hours after eating to work out.  Your body will burn more fat during the workout!",
        "Your metabolism is the engine that transforms the food you eat into usable energy for your body. Research shows that muscle mass is one of the key determinants of metabolic rate: balancing cardio sessions with resistance & weight training is essential to maintaining muscle mass, and a healthy and hungry metabolism!",
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
    static func getRandomTip() -> String {
        let idx = Int(arc4random_uniform(UInt32(nutritionTips.count)))
        return nutritionTips[idx]
    }
    
    static func getRandomMeal(meal:String) -> FoodItem? {
        switch (meal) {
        case CollectionNames.Breakfast:
            let idx = Int(arc4random_uniform(UInt32(breakfasts.count)))
            return breakfasts[idx]
        case CollectionNames.Lunch:
            let idx = Int(arc4random_uniform(UInt32(lunches.count)))
            return lunches[idx]
        case CollectionNames.Dinner:
            let idx = Int(arc4random_uniform(UInt32(dinners.count)))
            return dinners[idx]
        default:
            return nil
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
    
    static func addToFav(food:FoodItem) {
        Database.favorites.append(food)
        food.isFav = true
    }
    
    static func removeFromFav(food:FoodItem) {
        var removeIndex = -1
        for (index, item) in Database.favorites.enumerate() {
            if (item.name == food.name && item.calories == food.calories) {
                removeIndex = index
                break
            }
        }
        if (removeIndex >= 0) {
            Database.favorites.removeAtIndex(removeIndex)
            food.isFav = false
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