//
//  Colors.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/16/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import Foundation
import UIKit

struct Colors {
    static let AppGreen = UIColor.rgba(57, 181, 74, 1.0)
    static let RedAlizarin = UIColor.rgba(231, 76, 60, 0.7)
    static let BlueBelize = UIColor.rgba(41, 128, 185, 0.7)
    static let OrangeCarrot = UIColor.rgba(230, 126, 34, 0.7)
}

extension UIColor {
    class func rgba(red:Int, _ green: Int, _ blue:Int, _ alpha:CGFloat) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
    }
}