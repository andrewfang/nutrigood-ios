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
        FoodItem(name: "Chocolate Waffle", cals: 456, fats: 12.0, carbs: 44, protein: 40, allergens: ["gluten"], category: CollectionNames.Breakfast),
        FoodItem(name: "Pancakes and Syrup", cals: 460, fats: 10, carbs: 57, protein: 40, allergens: ["gluten"], category: CollectionNames.Breakfast),
        FoodItem(name: "Yogurt and Granola", cals: 790, fats: 18, carbs: 99, protein: 42, allergens: ["nuts"], category: CollectionNames.Breakfast),
        FoodItem(name: "Breakfast Sausage", cals: 80, fats: 1, carbs: 0, protein: 18, allergens: ["meat"], category: CollectionNames.Breakfast),
        FoodItem(name: "Oatmeal", cals: 309, fats: 15, carbs: 37, protein: 7, allergens: [], category: CollectionNames.Breakfast),
        FoodItem(name: "Muffin", cals: 294, fats: 19, carbs: 15, protein: 16, allergens: ["gluten"], category: CollectionNames.Breakfast),
        FoodItem(name: "Scrambled Eggs", cals: 180, fats: 5, carbs: 12, protein: 23, allergens: [], category: CollectionNames.Breakfast),
        FoodItem(name: "Quiche", cals: 168, fats: 1, carbs: 10, protein: 30, allergens: [], category: CollectionNames.Breakfast),
        FoodItem(name: "French Toast", cals: 175, fats: 2.6, carbs: 29.6, protein: 9.4, allergens: ["gluten"], category: CollectionNames.Breakfast),
        FoodItem(name: "Breakfast Burrito", cals: 313, fats: 10, carbs: 30, protein: 24.4, allergens: [], category: CollectionNames.Breakfast),
        FoodItem(name: "Mexican Frittata", cals: 302, fats: 16.3, carbs: 14, protein: 26.5, allergens: [], category: CollectionNames.Breakfast),
        FoodItem(name: "Fruit Bowl", cals: 283, fats: 7.5, carbs: 39, protein: 20.5, allergens: [], category: CollectionNames.Breakfast)
    ]
    static var lunches:[FoodItem] = [
        FoodItem(name: "Ham & Cheese Sandwich", cals: 340, fats: 4.1, carbs: 45.2, protein: 31.6, allergens: ["pork", "dairy"], category: CollectionNames.Lunch),
        FoodItem(name: "Tuna and Rice", cals: 700, fats: 4, carbs: 100, protein: 44, allergens: ["fish"], category: CollectionNames.Lunch),
        FoodItem(name: "Pita Pizza", cals: 415, fats: 45, carbs: 31, protein: 8, allergens: [], category: CollectionNames.Lunch),
        FoodItem(name: "Turkey Sliders", cals: 160, fats: 10, carbs: 7, protein: 11, allergens: ["poultry"], category: CollectionNames.Lunch),
        FoodItem(name: "Ceviche & Quinoa", cals: 540, fats: 15, carbs: 57, protein: 76, allergens: [], category: CollectionNames.Lunch),
        FoodItem(name: "Fish Burger", cals: 616, fats: 17, carbs: 67, protein: 49, allergens: ["fish"], category: CollectionNames.Lunch),
        FoodItem(name: "Fish Tacos", cals: 468, fats: 21, carbs: 37, protein: 31, allergens: ["fish"], category: CollectionNames.Lunch),
        FoodItem(name: "Mac and Cheese", cals: 71, fats: 3, carbs: 2, protein: 8, allergens: ["dairy"], category: CollectionNames.Lunch),
        FoodItem(name: "Beef Chili", cals: 380, fats: 6, carbs: 32, protein: 36, allergens: ["beef"], category: CollectionNames.Lunch),
        FoodItem(name: "Chicken Salad", cals: 554, fats: 37, carbs: 20, protein: 36, allergens: ["poultry"], category: CollectionNames.Lunch),
        FoodItem(name: "Bacon Pasta", cals: 268, fats: 15, carbs: 11, protein: 27, allergens: ["pork"], category: CollectionNames.Lunch),
        FoodItem(name: "Pork Tenderloin", cals: 399, fats: 14, carbs: 21, protein: 25, allergens: ["pork"], category: CollectionNames.Lunch),
        FoodItem(name: "Steak Salad", cals: 417, fats: 23, carbs: 15, protein: 35, allergens: ["beef"], category: CollectionNames.Lunch),
        FoodItem(name: "Tuna Salad", cals: 327, fats: 2, carbs: 18, protein: 60, allergens: ["fish"], category: CollectionNames.Lunch),
        FoodItem(name: "Caprese Salad", cals: 74, fats: 5, carbs: 1, protein: 5, allergens: [], category: CollectionNames.Lunch),
        FoodItem(name: "Quinoa Salad", cals: 141, fats: 6, carbs: 16, protein: 7, allergens: [], category: CollectionNames.Lunch),
        FoodItem(name: "Salad", cals: 167, fats: 9, carbs: 9, protein: 22, allergens: [], category: CollectionNames.Lunch),
        FoodItem(name: "Baked Potato", cals: 454, fats: 3, carbs: 66, protein: 47, allergens: [], category: CollectionNames.Lunch),
        FoodItem(name: "Beef Burger", cals: 406, fats: 13.7, carbs: 36, protein: 33, allergens: ["beef"], category: CollectionNames.Lunch),
        FoodItem(name: "Beef Stroganoff", cals: 273, fats: 13.6, carbs: 9, protein: 27.8, allergens: ["beef"], category: CollectionNames.Lunch),
        FoodItem(name: "Meatball Sub Sandwich", cals: 500, fats: 12, carbs: 41, protein: 47, allergens: ["beef"], category: CollectionNames.Lunch),
        
        
        
    ]
    static var dinners:[FoodItem] = [
        FoodItem(name: "Grilled Steak", cals: 549, fats: 20, carbs: 1.2, protein: 100, allergens: ["beef"], category: CollectionNames.Dinner),
        FoodItem(name: "Lasagna", cals: 1012, fats: 32, carbs: 72, protein: 136, allergens: ["dairy"], category: CollectionNames.Dinner),
        FoodItem(name: "Glazed Ham", cals: 416, fats: 13.1, carbs: 11.2, protein: 59.7, allergens: ["pork"], category: CollectionNames.Dinner),
        FoodItem(name: "Bison", cals: 240, fats: 8, carbs: 3, protein: 38, allergens: ["meat"], category: CollectionNames.Dinner),
        FoodItem(name: "Steak Taco", cals: 380, fats: 18.5, carbs: 29.5, protein: 28, allergens: ["beef"], category: CollectionNames.Dinner),
        FoodItem(name: "Chicken Spaghetti", cals: 275, fats: 12, carbs: 13.4, protein: 29, allergens: ["poultry"], category: CollectionNames.Dinner),
        FoodItem(name: "Chicken and Rice", cals: 487, fats: 17.1, carbs: 24.1, protein: 59.2, allergens: ["poultry"], category: CollectionNames.Dinner),
        FoodItem(name: "Chickpea Stew", cals: 221, fats: 2.1, carbs: 29.6, protein: 15, allergens: [], category: CollectionNames.Dinner),
        FoodItem(name: "Stuffed Chicken Breast", cals: 363, fats: 6, carbs: 32, protein: 43, allergens: ["poultry"], category: CollectionNames.Dinner),
        FoodItem(name: "Pineapple Chicken", cals: 343, fats: 15.7, carbs: 11, protein: 49, allergens: ["poultry"], category: CollectionNames.Dinner),
        FoodItem(name: "Pad Thai", cals: 458, fats: 14, carbs: 39, protein: 56, allergens: ["nuts"], category: CollectionNames.Dinner),
        FoodItem(name: "Meatballs & Squash", cals: 1489, fats: 39, carbs: 115, protein: 156, allergens: ["meat"], category: CollectionNames.Dinner),
        FoodItem(name: "Turkey Burger", cals: 388, fats: 8.2, carbs: 39, protein: 49, allergens: ["poultry"], category: CollectionNames.Dinner),
        FoodItem(name: "Chicken Enchilada", cals: 525, fats: 9, carbs: 61, protein: 60, allergens: ["poultry", "dairy"], category: CollectionNames.Dinner),
        FoodItem(name: "Chicken Kabobs", cals: 470, fats: 6.2, carbs: 20, protein: 80, allergens: ["poultry"], category: CollectionNames.Dinner),
        FoodItem(name: "Honey Salmon", cals: 484, fats: 26, carbs: 40, protein: 41, allergens: ["fish"], category: CollectionNames.Dinner),
        FoodItem(name: "Tuna Wrap", cals: 64, fats: 1.5, carbs: 5, protein: 8, allergens: ["fish"], category: CollectionNames.Dinner),
        FoodItem(name: "Sushi", cals: 325, fats: 18.6, carbs: 22, protein: 23, allergens: ["fish"], category: CollectionNames.Dinner),
        FoodItem(name: "Grilled Cod", cals: 360, fats: 16, carbs: 10, protein: 61, allergens: ["fish"], category: CollectionNames.Dinner),
        FoodItem(name: "Halibut", cals: 358, fats: 11.6, carbs: 29, protein: 30.2, allergens: ["fish"], category: CollectionNames.Dinner),
        FoodItem(name: "Shrimp Ceviche", cals: 111, fats: 4.4, carbs: 5.5, protein: 12.5, allergens: ["fish"], category: CollectionNames.Dinner),
        FoodItem(name: "Shrimp and Rice", cals: 223, fats: 1.2, carbs: 28, protein: 23, allergens: ["fish"], category: CollectionNames.Dinner),
        FoodItem(name: "Noodle Soup", cals: 83, fats: 1.2, carbs: 5, protein: 6.8, allergens: [], category: CollectionNames.Dinner),
        FoodItem(name: "Pasta with Shrimp", cals: 310, fats: 9, carbs: 37, protein: 21, allergens: ["fish"], category: CollectionNames.Dinner),
        FoodItem(name: "Tilapia", cals: 265, fats: 4, carbs: 24, protein: 33, allergens: ["fish"], category: CollectionNames.Dinner),
        FoodItem(name: "Lettuce Wraps", cals: 85, fats: 1, carbs: 5, protein: 14, allergens: ["nuts"], category: CollectionNames.Dinner),
        FoodItem(name: "Grilled Potatos", cals: 195, fats: 4, carbs: 36, protein: 5, allergens: [], category: CollectionNames.Dinner),
        
        
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
    
    static var suggestions:[String] = [
        "May I suggest...",
        "How about...",
        "Would you like some...",
        "I suggest...",
        "I think you should have some...",
    ]
    
    static func suggest() -> String {
        let idx = Int(arc4random_uniform(UInt32(suggestions.count)))
        return suggestions[idx]
    }
    
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