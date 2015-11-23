//
//  Global.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/22/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import Foundation
import UIKit

// Generalizeable Alert
extension UIAlertController {
    static func makeSimpleAlert(title:String, message:String, actionText:String) -> UIAlertController{
        let alertController = UIAlertController(title: title,
            message: message,
            preferredStyle: .Alert)
        let defaultAction = UIAlertAction(title: actionText,
            style: .Default,
            handler: nil)
        alertController.addAction(defaultAction)
        return alertController
    }
}