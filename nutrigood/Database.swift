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
        FoodItem(name: "Strawberries", cals: 32, fats: 0.3, carbs: 7.68, favs: 3, protein: 0.67, category: CollectionNames.Breakfast),
        FoodItem(name: "Blueberries", cals: 57, fats: 0.33, carbs: 21.45, favs: 3, protein: 0.74, category: CollectionNames.Breakfast),
        FoodItem(name: "Blackberries", cals: 43, fats: 0.49, carbs: 9.61, favs: 3, protein: 1.39, category: CollectionNames.Breakfast),
        FoodItem(name: "Raspberries", cals: 52, fats: 0.65, carbs: 11.94, favs: 3, protein: 1.2, category: CollectionNames.Breakfast),
        FoodItem(name: "Grapes", cals: 57, fats: 0.47, carbs: 13.93, favs: 3, protein: 0.81, category: CollectionNames.Breakfast),
        FoodItem(name: "Grapefruit", cals: 30, fats: 0.1, carbs: 7.5, favs: 3, protein: 0.55, category: CollectionNames.Breakfast),
        FoodItem(name: "Apple", cals: 52, fats: 0.17, carbs: 13.81, favs: 3, protein: 0.26, category: CollectionNames.Breakfast),
        FoodItem(name: "Banana", cals: 89, fats: 0.33, carbs: 22.84, favs: 3, protein: 1.09, category: CollectionNames.Breakfast),
        FoodItem(name: "Orange", cals: 47, fats: 0.12, carbs: 11.75, favs: 3, protein: 0.94, category: CollectionNames.Breakfast),
        FoodItem(name: "Pear", cals: 57, fats: 0.14, carbs: 15.23, favs: 3, protein: 0.36, category: CollectionNames.Breakfast),
        FoodItem(name: "Plum", cals: 46, fats: 0.28, carbs: 11.42, favs: 3, protein: 0.7, category: CollectionNames.Breakfast),
        FoodItem(name: "Pineapple", cals: 50, fats: 0.12, carbs: 13.12, favs: 3, protein: 0.54, category: CollectionNames.Breakfast),
        FoodItem(name: "Mango", cals: 60, fats: 0.38, carbs: 14.98, favs: 3, protein: 0.82, category: CollectionNames.Breakfast),
        FoodItem(name: "Melon", cals: 36, fats: 0.14, carbs: 9.09, favs: 3, protein: 0.54, category: CollectionNames.Breakfast),
        FoodItem(name: "Cantaloupe", cals: 34, fats: 0.19, carbs: 8.16, favs: 3, protein: 0.84, category: CollectionNames.Breakfast),
        FoodItem(name: "Watermelon", cals: 30, fats: 0.15, carbs: 7.55, favs: 3, protein: 0.61, category: CollectionNames.Breakfast),
        FoodItem(name: "Kiwi", cals: 61, fats: 0.52, carbs: 14.66, favs: 3, protein: 1.14, category: CollectionNames.Breakfast),
        FoodItem(name: "Plantains", cals: 122, fats: 0.37, carbs: 31.89, favs: 3, protein: 1.3, category: CollectionNames.Breakfast),
        FoodItem(name: "Lychee Fruit", cals: 66, fats: 0.44, carbs: 16.53, favs: 3, protein: 0.83, category: CollectionNames.Breakfast),
    ]
    static var lunches:[FoodItem] = [
        FoodItem(name: "Chicken Sandwich", cals: 2, fats: 2, carbs: 3, favs: 3, protein: 0.88, category: CollectionNames.Lunch),
        FoodItem(name: "Pasta", cals: 2, fats: 2, carbs: 3, favs: 3, protein: 0.88, category: CollectionNames.Lunch),
        FoodItem(name: "Tomato", cals: 18, fats: 0.2, carbs: 3.89, favs: 3, protein: 0.88, category: CollectionNames.Lunch),
    ]
    static var dinners:[FoodItem] = [
        FoodItem(name: "Pulled Pork", cals: 2, fats: 2, carbs: 3, favs: 3, protein: 0.88, category: CollectionNames.Dinner),
        FoodItem(name: "Chicken Thighs", cals: 2, fats: 2, carbs: 3, favs: 3, protein: 0.88, category: CollectionNames.Dinner),
    ]
    
    
    
    
    static var tips:[String] = [
        "Eat more protein to get strong",
        "Not all fats are bad for you. In fact, transfats are the only things that suck. You see, the word trans comes from transit, which is bad.",
    ]
    
    static var exerciseTips:[String] = [
        "If you are big on cardio, it’s important to build large energy stores with complex carbohydrates: regular pasta and rice are your friends!",
        "Want to get better results from your weightlifting sessions?  Follow-up with some chocolate milk or some of these recovery foods: http://www.outsideonline.com/1898066/top-10-recovery-foods",
        "Wait around 2 hours after eating to work out.  Your body will burn more fat during the workout!",
        "Your metabolism is the engine that transforms the food you eat into usable energy for your body. Research shows that muscle mass is one of the key determinants of metabolic rate: balancing cardio sessions with resistance & weight training is essential to maintaining muscle mass, and a healthy and hungry metabolism!",
    ]
    
    static var nutritionTips:[String] = [
        "Try not to eat late at night, just before bed.",
        "It’s best for breakfast to be your largest meal, lunch to be your second largest, and dinner to be your smallest, since you will be burning energy throughout the day, and burning much less energy when you sleep!",
        "Eat smaller meals more frequently throughout the day.",
        "Lean proteins (chicken, fish, tofu) are key to building the type of healthy muscle mass that your body thrives on.",
        "In the United States, the most common dietary nutritional deficiency is Vitamin B6.  Other Vitamins (A, C, D, E, K), as well as minerals (Calcium, Magnesium, Iron) are an extremely important part of your diet, for bone, organ, muscle, skin and cell health.  Get your fix on vitamins by eating lots of fruits and vegetables.  Bran rice is great for vitamin B6.",
        "Don’t drink sugar calories!  Sugary drinks are the most fattening things you can put into your body because the liquid sugar calories don’t get registered by the brain in the same way as calories from solid foods (http://www.ncbi.nlm.nih.gov/pubmed/10878689).  Fruit juice is almost as bad as soda!",
        "Eat lots of nuts - they are loaded with key vitamins and minerals, as well as fiber (http://ndb.nal.usda.gov/ndb/foods/show/3667).  Nuts are super because they can help you lose weight, fight type 2 diabetes and heart disease.",
        "Avoid processed foods: they have been engineered to be \"hyper-rewarding,\" so they trick our brains into eating more than we need!",
        "Eating 100 less calories per day can amount to some big savings: up to 10lbs per year!",
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
            let idx = Int(arc4random_uniform(UInt32(nutritionTips.count)))
            return nutritionTips[idx]
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