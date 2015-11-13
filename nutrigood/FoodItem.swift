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
    var fats:Int!
    var carbs: Int!
    var favs:Int!
    var category:String!
    var inCart:Bool = false
    
    init(name:String, cals:Int, fats:Int, carbs:Int, favs:Int, category:String) {
        self.name = name
        self.calories = cals
        self.fats = fats
        self.carbs = carbs
        self.favs = favs
        self.category = category
    }
    
    var image:UIImage? {
        get {
            return FoodItem.getImageFromFlickrWithSearchQuery(self.name)
        }
    }
    
    // Given a name, returns a flickr url string for search
    private class func makeSearchURL(name:String) -> String {
        // TODO: fill me in
        return ""
    }
    
    private class func getFlickrImage(farmid:String, serverid:String, id:String, secret:String) -> String {
        return "https://farm\(farmid).staticflickr.com/\(serverid)/\(id)_\(secret).jpg"
    }
    
    // returns an image from flickr based on the name
    class func getImageFromFlickrWithSearchQuery(name:String) -> UIImage? {
        if let url = NSURL(string:makeSearchURL(name)) {
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)) {
                if let data = NSData(contentsOfURL: url) {
                    dispatch_async(dispatch_get_main_queue()){
                        return UIImage(data: data)
                    }
                }
            }
        }
        return UIImage(named: "testImage")
    }
    

    
}