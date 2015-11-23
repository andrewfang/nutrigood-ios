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
        FoodItem(name: "Yogurt", cals: 63, fats: 1.55, carbs: 7.04, favs: 3, protein: 5.25, category: CollectionNames.Breakfast),
        FoodItem(name: "Cinnamon", cals: 247, fats: 1.24, carbs: 80.59, favs: 3, protein: 3.99, category: CollectionNames.Breakfast),
        FoodItem(name: "Sugar", cals: 387, fats: 0, carbs: 99.98, favs: 3, protein: 0, category: CollectionNames.Breakfast),
        FoodItem(name: "Butter", cals: 717, fats: 81.11, carbs: 0.06, favs: 3, protein: 0.85, category: CollectionNames.Breakfast),
        FoodItem(name: "Brown Sugar", cals: 380, fats: 0, carbs: 98.09, favs: 3, protein: 0.12, category: CollectionNames.Breakfast),
        FoodItem(name: "Pepper", cals: 251, fats: 3.26, carbs: 63.95, favs: 3, protein: 10.39, category: CollectionNames.Breakfast),
        FoodItem(name: "Egg", cals: 143, fats: 9.51, carbs: 0.72, favs: 3, protein: 12.56, category: CollectionNames.Breakfast),
        FoodItem(name: "Milk", cals: 50, fats: 1.98, carbs: 4.80, favs: 3, protein: 3.30, category: CollectionNames.Breakfast),
        FoodItem(name: "Bagel", cals: 264, fats: 1.32, carbs: 52.38, favs: 3, protein: 10.56, category: CollectionNames.Breakfast),
        FoodItem(name: "Orange Juice", cals: 45, fats: 0.20, carbs: 10.40, favs: 3, protein: 0.70, category: CollectionNames.Breakfast),
        FoodItem(name: "Apple Juice", cals: 22, fats: 0.10, carbs: 5.10, favs: 3, protein: 0.00, category: CollectionNames.Breakfast),
        FoodItem(name: "Grape Juice", cals: 62, fats: 0.13, carbs: 14.77, favs: 3, protein: 0.37, category: CollectionNames.Breakfast),
        FoodItem(name: "Pineapple Juice", cals: 53, fats: 0.12, carbs: 12.87, favs: 3, protein:0.36, category: CollectionNames.Breakfast),
        FoodItem(name: "Wheat Bread", cals: 267, fats: 3.24, carbs: 48.68, favs: 3, protein: 10.72, category: CollectionNames.Breakfast),
        FoodItem(name: "White Bread", cals: 238, fats: 2.15, carbs: 43.91, favs: 3, protein: 10.66, category: CollectionNames.Breakfast),
    ]
    static var lunches:[FoodItem] = [
        FoodItem(name: "Tomato", cals: 18, fats: 0.2, carbs: 3.89, favs: 3, protein: 0.88, category: CollectionNames.Lunch),
        FoodItem(name: "White Potato", cals: 69, fats: 0.1, carbs: 15.71, favs: 3, protein: 1.68, category: CollectionNames.Lunch),
        FoodItem(name: "Sweet Potato", cals: 86, fats: 0.05, carbs: 20.12, favs: 3, protein: 1.57, category: CollectionNames.Lunch),
        FoodItem(name: "Carrot", cals: 41, fats: 0.24, carbs: 9.58, favs: 3, protein: 0.93, category: CollectionNames.Lunch),
        FoodItem(name: "Green Beans", cals: 31, fats: 0.22, carbs: 6.97, favs: 3, protein: 1.83, category: CollectionNames.Lunch),
        FoodItem(name: "Edamame", cals: 109, fats: 4.73, carbs: 7.61, favs: 3, protein: 11.22, category: CollectionNames.Lunch),
        FoodItem(name: "Celery", cals: 16, fats: 0.17, carbs: 2.97, favs: 3, protein: 0.69, category: CollectionNames.Lunch),
        FoodItem(name: "Lettuce", cals: 15, fats: 0.15, carbs: 2.87, favs: 3, protein: 1.36, category: CollectionNames.Lunch),
        FoodItem(name: "Spinach", cals: 23, fats: 0.39, carbs: 3.63, favs: 3, protein: 2.86, category: CollectionNames.Lunch),
        FoodItem(name: "Broccoli", cals: 34, fats: 0.37, carbs: 6.64, favs: 3, protein: 2.82, category: CollectionNames.Lunch),
        FoodItem(name: "Cauliflower", cals: 90, fats: 0.28, carbs: 4.97, favs: 3, protein: 1.92, category: CollectionNames.Lunch),
        FoodItem(name: "Zucchini", cals: 17, fats: 0.32, carbs: 3.11, favs: 3, protein: 1.21, category: CollectionNames.Lunch),
        FoodItem(name: "Cucumber", cals: 15, fats: 0.11, carbs: 3.63, favs: 3, protein: 0.65, category: CollectionNames.Lunch),
        FoodItem(name: "Pickles", cals: 11, fats: 0.2, carbs: 2.26, favs: 3, protein: 0.33, category: CollectionNames.Lunch),
        FoodItem(name: "Cheddar Cheese", cals: 404, fats: 33.31, carbs: 3.09, favs: 3, protein: 22.87, category: CollectionNames.Lunch),
        FoodItem(name: "Mozzarella Cheese", cals: 300, fats: 22.35, carbs: 2.19, favs: 3, protein: 22.17, category: CollectionNames.Lunch),
        FoodItem(name: "Parmesan Cheese", cals: 392, fats: 25.83, carbs: 3.22, favs: 3, protein: 35.75, category: CollectionNames.Lunch),
        FoodItem(name: "Brie Cheese", cals: 334, fats: 27.68, carbs: 0.45, favs: 3, protein: 20.75, category: CollectionNames.Lunch),
        FoodItem(name: "Chicken", cals: 119, fats: 3.08, carbs: 0, favs: 3, protein: 21.39, category: CollectionNames.Dinner),
        FoodItem(name: "Pork", cals: 376, fats: 35.07, carbs: 0.00, favs: 3, protein: 13.91, category: CollectionNames.Lunch),
        FoodItem(name: "Beef", cals: 165, fats: 8.29, carbs: 0, favs: 3, protein: 21.22, category: CollectionNames.Lunch),
        FoodItem(name: "Turkey", cals: 143, fats:5.64, carbs: 0.13, favs: 3, protein: 21.64, category: CollectionNames.Lunch),
        FoodItem(name: "Duck", cals: 404, fats: 39.34, carbs: 0, favs: 3, protein: 11.49, category: CollectionNames.Lunch),
        FoodItem(name: "Venison", cals: 120, fats: 2.42, carbs: 0, favs: 3, protein: 22.96, category: CollectionNames.Lunch),
        FoodItem(name: "Veal", cals: 90, fats: 1, carbs: 18, favs: 3, protein: 4, category: CollectionNames.Lunch),
        FoodItem(name: "Lamb", cals: 240, fats: 18.52, carbs: 0.13, favs: 3, protein: 18.12, category: CollectionNames.Lunch),
        FoodItem(name: "Rabbit", cals: 114, fats: 2.32, carbs: 0, favs: 3, protein: 21.79, category: CollectionNames.Lunch),
        FoodItem(name: "White Rice", cals: 370, fats: 0.55, carbs: 81.68, favs: 3, protein: 6.81, category: CollectionNames.Lunch),
        FoodItem(name: "Pasta", cals: 371, fats: 1.51, carbs: 74.67, favs: 3, protein: 13.04, category: CollectionNames.Lunch),
        FoodItem(name: "Beets", cals: 43, fats: 0.17, carbs: 9.56, favs: 3, protein: 1.61, category: CollectionNames.Lunch),
        FoodItem(name: "Avocado", cals: 167, fats: 15.41, carbs: 8.64, favs: 3, protein: 1.96, category: CollectionNames.Lunch),
        FoodItem(name: "Olives", cals: 115, fats: 10.68, carbs: 6.26, favs: 3, protein: 0.84, category: CollectionNames.Lunch),
        FoodItem(name: "Parsley", cals: 36, fats: 0.79, carbs: 6.33, favs: 3, protein: 2.97, category: CollectionNames.Lunch),
        FoodItem(name: "Basil", cals: 23, fats: 0.64, carbs: 2.65, favs: 3, protein: 3.15, category: CollectionNames.Lunch),
        FoodItem(name: "Rosemary", cals: 131, fats: 5.86, carbs: 20.70, favs: 3, protein: 3.31, category: CollectionNames.Lunch),
        FoodItem(name: "Cinnamon", cals: 247, fats: 1.24, carbs: 80.59, favs: 3, protein: 3.99, category: CollectionNames.Lunch),
        FoodItem(name: "Sugar", cals: 387, fats: 0, carbs: 99.98, favs: 3, protein: 0, category: CollectionNames.Lunch),
        FoodItem(name: "Butter", cals: 717, fats: 81.11, carbs: 0.06, favs: 3, protein: 0.85, category: CollectionNames.Lunch),
        FoodItem(name: "Brown Sugar", cals: 380, fats: 0, carbs: 98.09, favs: 3, protein: 0.12, category: CollectionNames.Lunch),
        FoodItem(name: "Pepper", cals: 251, fats: 3.26, carbs: 63.95, favs: 3, protein: 10.39, category: CollectionNames.Lunch),
        FoodItem(name: "Mushroom", cals: 22, fats: 0.34, carbs: 3.26, favs: 3, protein: 0.34, category: CollectionNames.Lunch),
        FoodItem(name: "Onion", cals: 40, fats: 0.10, carbs: 9.34, favs: 3, protein: 1.10, category: CollectionNames.Lunch),
        FoodItem(name: "Cabbage", cals: 25, fats: 0.10, carbs: 5.80, favs: 3, protein: 1.28, category: CollectionNames.Lunch),
        FoodItem(name: "Capers", cals: 23, fats: 0.86, carbs: 4.89, favs: 3, protein: 2.36, category: CollectionNames.Lunch),
        FoodItem(name: "Wheat Bread", cals: 267, fats: 3.24, carbs: 48.68, favs: 3, protein: 10.72, category: CollectionNames.Lunch),
        FoodItem(name: "White Bread", cals: 238, fats: 2.15, carbs: 43.91, favs: 3, protein: 10.66, category: CollectionNames.Lunch),
        FoodItem(name: "Tortilla", cals: 218, fats: 2.85, carbs: 44.64, favs: 3, protein: 5.70, category: CollectionNames.Lunch),
        FoodItem(name: "Ice Cream", cals: 216, fats: 11.00, carbs: 28.20, favs: 3, protein: 3.80, category: CollectionNames.Lunch),
        FoodItem(name: "Noodles", cals: 475, fats: 15.43, carbs: 72.80, favs: 3, protein: 8.11, category: CollectionNames.Lunch),
            
    ]
    static var dinners:[FoodItem] = [
        FoodItem(name: "White Potato", cals: 69, fats: 0.1, carbs: 15.71, favs: 3, protein: 1.68, category: CollectionNames.Dinner),
        FoodItem(name: "Sweet Potato", cals: 86, fats: 0.05, carbs: 20.12, favs: 3, protein: 1.57, category: CollectionNames.Dinner),
        FoodItem(name: "Carrot", cals: 41, fats: 0.24, carbs: 9.58, favs: 3, protein: 0.93, category: CollectionNames.Dinner),
        FoodItem(name: "Green Beans", cals: 31, fats: 0.22, carbs: 6.97, favs: 3, protein: 1.83, category: CollectionNames.Dinner),
        FoodItem(name: "Edamame", cals: 109, fats: 4.73, carbs: 7.61, favs: 3, protein: 11.22, category: CollectionNames.Dinner),
        FoodItem(name: "Celery", cals: 16, fats: 0.17, carbs: 2.97, favs: 3, protein: 0.69, category: CollectionNames.Dinner),
        FoodItem(name: "Lettuce", cals: 15, fats: 0.15, carbs: 2.87, favs: 3, protein: 1.36, category: CollectionNames.Dinner),
        FoodItem(name: "Spinach", cals: 23, fats: 0.39, carbs: 3.63, favs: 3, protein: 2.86, category: CollectionNames.Dinner),
        FoodItem(name: "Broccoli", cals: 34, fats: 0.37, carbs: 6.64, favs: 3, protein: 2.82, category: CollectionNames.Dinner),
        FoodItem(name: "Cauliflower", cals: 90, fats: 0.28, carbs: 4.97, favs: 3, protein: 1.92, category: CollectionNames.Dinner),
        FoodItem(name: "Zucchini", cals: 17, fats: 0.32, carbs: 3.11, favs: 3, protein: 1.21, category: CollectionNames.Dinner),
        FoodItem(name: "Cucumber", cals: 15, fats: 0.11, carbs: 3.63, favs: 3, protein: 0.65, category: CollectionNames.Dinner),
        FoodItem(name: "Pickles", cals: 11, fats: 0.2, carbs: 2.26, favs: 3, protein: 0.33, category: CollectionNames.Dinner),
        FoodItem(name: "Cheddar Cheese", cals: 404, fats: 33.31, carbs: 3.09, favs: 3, protein: 22.87, category: CollectionNames.Dinner),
        FoodItem(name: "Mozzarella Cheese", cals: 300, fats: 22.35, carbs: 2.19, favs: 3, protein: 22.17, category: CollectionNames.Dinner),
        FoodItem(name: "Parmesan Cheese", cals: 392, fats: 25.83, carbs: 3.22, favs: 3, protein: 35.75, category: CollectionNames.Dinner),
        FoodItem(name: "Brie Cheese", cals: 334, fats: 27.68, carbs: 0.45, favs: 3, protein: 20.75, category: CollectionNames.Dinner),
        FoodItem(name: "Chicken", cals: 119, fats: 3.08, carbs: 0, favs: 3, protein: 21.39, category: CollectionNames.Dinner),
        FoodItem(name: "Pork", cals: 376, fats: 35.07, carbs: 0.00, favs: 3, protein: 13.91, category: CollectionNames.Dinner),
        FoodItem(name: "Beef", cals: 165, fats: 8.29, carbs: 0, favs: 3, protein: 21.22, category: CollectionNames.Dinner),
        FoodItem(name: "Turkey", cals: 143, fats:5.64, carbs: 0.13, favs: 3, protein: 21.64, category: CollectionNames.Dinner),
        FoodItem(name: "Duck", cals: 404, fats: 39.34, carbs: 0, favs: 3, protein: 11.49, category: CollectionNames.Dinner),
        FoodItem(name: "Venison", cals: 120, fats: 2.42, carbs: 0, favs: 3, protein: 22.96, category: CollectionNames.Dinner),
        FoodItem(name: "Veal", cals: 90, fats: 1, carbs: 18, favs: 3, protein: 4, category: CollectionNames.Dinner),
        FoodItem(name: "Lamb", cals: 240, fats: 18.52, carbs: 0.13, favs: 3, protein: 18.12, category: CollectionNames.Dinner),
        FoodItem(name: "Rabbit", cals: 114, fats: 2.32, carbs: 0, favs: 3, protein: 21.79, category: CollectionNames.Dinner),
        FoodItem(name: "White Rice", cals: 370, fats: 0.55, carbs: 81.68, favs: 3, protein: 6.81, category: CollectionNames.Dinner),
        FoodItem(name: "Pasta", cals: 371, fats: 1.51, carbs: 74.67, favs: 3, protein: 13.04, category: CollectionNames.Dinner),
        FoodItem(name: "Beets", cals: 43, fats: 0.17, carbs: 9.56, favs: 3, protein: 1.61, category: CollectionNames.Dinner),
        FoodItem(name: "Avocado", cals: 167, fats: 15.41, carbs: 8.64, favs: 3, protein: 1.96, category: CollectionNames.Dinner),
        FoodItem(name: "Olives", cals: 115, fats: 10.68, carbs: 6.26, favs: 3, protein: 0.84, category: CollectionNames.Dinner),
        FoodItem(name: "Parsley", cals: 36, fats: 0.79, carbs: 6.33, favs: 3, protein: 2.97, category: CollectionNames.Dinner),
        FoodItem(name: "Basil", cals: 23, fats: 0.64, carbs: 2.65, favs: 3, protein: 3.15, category: CollectionNames.Dinner),
        FoodItem(name: "Rosemary", cals: 131, fats: 5.86, carbs: 20.70, favs: 3, protein: 3.31, category: CollectionNames.Dinner),
        FoodItem(name: "Cinnamon", cals: 247, fats: 1.24, carbs: 80.59, favs: 3, protein: 3.99, category: CollectionNames.Dinner),
        FoodItem(name: "Sugar", cals: 387, fats: 0, carbs: 99.98, favs: 3, protein: 0, category: CollectionNames.Dinner),
        FoodItem(name: "Butter", cals: 717, fats: 81.11, carbs: 0.06, favs: 3, protein: 0.85, category: CollectionNames.Dinner),
        FoodItem(name: "Brown Sugar", cals: 380, fats: 0, carbs: 98.09, favs: 3, protein: 0.12, category: CollectionNames.Dinner),
        FoodItem(name: "Pepper", cals: 251, fats: 3.26, carbs: 63.95, favs: 3, protein: 10.39, category: CollectionNames.Dinner),
        FoodItem(name: "Mushroom", cals: 22, fats: 0.34, carbs: 3.26, favs: 3, protein: 0.34, category: CollectionNames.Dinner),
        FoodItem(name: "Onion", cals: 40, fats: 0.10, carbs: 9.34, favs: 3, protein: 1.10, category: CollectionNames.Dinner),
        FoodItem(name: "Cabbage", cals: 25, fats: 0.10, carbs: 5.80, favs: 3, protein: 1.28, category: CollectionNames.Dinner),
        FoodItem(name: "Capers", cals: 23, fats: 0.86, carbs: 4.89, favs: 3, protein: 2.36, category: CollectionNames.Dinner),
        FoodItem(name: "Wheat Bread", cals: 267, fats: 3.24, carbs: 48.68, favs: 3, protein: 10.72, category: CollectionNames.Dinner),
        FoodItem(name: "White Bread", cals: 238, fats: 2.15, carbs: 43.91, favs: 3, protein: 10.66, category: CollectionNames.Dinner),
        FoodItem(name: "Tortilla", cals: 218, fats: 2.85, carbs: 44.64, favs: 3, protein: 5.70, category: CollectionNames.Dinner),
        FoodItem(name: "Ice Cream", cals: 216, fats: 11.00, carbs: 28.20, favs: 3, protein: 3.80, category: CollectionNames.Dinner),
        FoodItem(name: "Noodles", cals: 475, fats: 15.43, carbs: 72.80, favs: 3, protein: 8.11, category: CollectionNames.Dinner),
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
        "Avoid processed foods: they have been engineered to be \"hyper-rewardin,\" so they trick our brains into eating more than we need!",
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