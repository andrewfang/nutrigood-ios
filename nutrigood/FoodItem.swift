//
//  FoodItem.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/12/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import Foundation
import UIKit

class FoodItem {
    
    var name:String!
    var calories:Int!
    var fats:Double!
    var carbs: Double!
    var protein:Double!
    var allergens:[String]!
    var category:String!
    var inCart:Bool = false
    var isFav:Bool = false
    
    init(name:String, cals:Int, fats:Double, carbs:Double, protein:Double, allergens:[String], category:String) {
        self.name = name
        self.calories = cals
        self.fats = round(fats * 10) / 10.0
        self.carbs = round(carbs * 10) / 10.0
        self.protein = round(protein * 10) / 10.0
        self.category = category
        self.allergens = allergens
    }
    
    var image:UIImage?
    
    // Given a name, returns a flickr url string for search
    private class func makeSearchURL(name:String) -> String {
        let newName = name.stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
        let urlString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=0305bd4541f12f444960d16eb85e0b8c&tags=" + newName + "&format=json&nojsoncallback=1&per_page=1"
        if let url = NSURL(string:urlString) {
            if let data = NSData(contentsOfURL: url) {
                do {
                    if let json:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                        if let photoDict = json["photos"] as? NSDictionary {
                            if let photoArr = photoDict["photo"] as? NSArray {
                                if (photoArr.count < 1) {
                                    return "http://www.eyetotheuniverse.com/wp-content/uploads/2014/12/best-food.jpg"
                                }
                                if let imageDict = photoArr[0] as? NSDictionary {
                                    let id = imageDict["id"] as! String
                                    let farmId = imageDict["farm"] as! Int
                                    let serverid = imageDict["server"] as! String
                                    let secret = imageDict["secret"] as! String
                                    return "https://farm\(farmId).staticflickr.com/\(serverid)/\(id)_\(secret).jpg"
                                }
                            }
                        }
                    }
                } catch {
                    // ignore
                }
            }
        }
        return ""
    }
    
    // returns an image from flickr based on the name
    class func getImageURLFromFlickrWithSearchQuery(name:String) -> NSURL? {
        if let url = NSURL(string:makeSearchURL(name)) {
            return url
        }
        return nil
    }
    

    
}