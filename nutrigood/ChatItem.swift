//
//  ChatItem.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/13/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//


struct ChatItem {
    var content:String!
    var type:ChatType!
    var foodItem:FoodItem?
    var tip:Database.HtmlTip?
    
    init(content:String, type:ChatType) {
        self.content = content
        self.type = type
    }
    
    init(tip:Database.HtmlTip, type:ChatType) {
        self.content = tip.tip
        self.type = type
        self.tip = tip
    }
    
    init(content:FoodItem) {
        self.content = content.name
        self.type = ChatType.AIFood
        self.foodItem = content
    }
}

enum ChatType {
    case User
    case AI
    case AIFood
}