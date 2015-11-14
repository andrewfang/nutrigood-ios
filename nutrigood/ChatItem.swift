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
    
    init(content:String, type:ChatType) {
        self.content = content
        self.type = type
    }
}

enum ChatType {
    case User
    case AI
}