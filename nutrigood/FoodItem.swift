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
    var fats:Float!
    var carbs: Float!
    var favs:Float!
    var protein:Float!
    var category:String!
    var inCart:Bool = false
    
    init(name:String, cals:Int, fats:Float, carbs:Float, favs:Float, protein:Float, category:String) {
        self.name = name
        self.calories = cals
        self.fats = fats
        self.carbs = carbs
        self.favs = favs
        self.protein = protein
        self.category = category
    }
    
    var image:UIImage? {
        get {
            // Blocks
            if let url = FoodItem.getImageURLFromFlickrWithSearchQuery(self.name) {
                if let data = NSData(contentsOfURL: url) {
                    return UIImage(data: data)
                }
            }
            return nil
        }
    }
    
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