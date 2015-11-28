//
//  InterfaceController.swift
//  NutriGoodWatch Extension
//
//  Created by Andrew Fang on 11/26/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var backgroundGroup: WKInterfaceGroup!
    @IBOutlet var syncButton: WKInterfaceGroup!
    @IBOutlet var lastSyncedLabel: WKInterfaceLabel!
    
    private struct Constants {
        static let DefaultDateKey = "DefaultDateKey"
    }
    var dater:NSDateFormatter!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.dater = NSDateFormatter()
        
        self.setupLastSynced()
    }
    
    
    private func setupLastSynced() {
        if let lastSyncedDate = NSUserDefaults.standardUserDefaults().objectForKey(Constants.DefaultDateKey) as? NSDate {
            
            self.dater.dateStyle = .ShortStyle
            self.dater.timeStyle = .NoStyle
            let today = NSDate(timeIntervalSinceNow: 0)
            
            let result = self.dater.stringFromDate(lastSyncedDate)
            if (result == self.dater.stringFromDate(today)) {
                self.dater.dateStyle = .NoStyle
                self.dater.timeStyle = .ShortStyle
            } else {
                self.dater.dateStyle = .NoStyle
                self.dater.timeStyle = .ShortStyle
            }
            
            self.lastSyncedLabel.setText("Last synced \(self.dater.stringFromDate(lastSyncedDate))")
        }
    }
    
    @IBAction func sync() {
        let duration = 0.5
        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64((duration + 0.15) * Double(NSEC_PER_SEC)))
        self.backgroundGroup.setBackgroundImageNamed("Progress")
        self.backgroundGroup.startAnimatingWithImagesInRange(NSRange(location: 0, length: 10), duration: duration, repeatCount: 1)
        dispatch_after(delay, dispatch_get_main_queue()) { () -> Void in
            self.animateWithDuration(0.5, animations: {
                self.syncButton.setHeight(90)
                self.syncButton.setWidth(90)
            })
            let date = NSDate(timeIntervalSinceNow: 0)
            self.dater.dateStyle = .NoStyle
            self.dater.timeStyle = .ShortStyle
            self.lastSyncedLabel.setText("Last synced \(self.dater.stringFromDate(date))")
            NSUserDefaults.standardUserDefaults().setObject(date, forKey: Constants.DefaultDateKey)
        }
        
        let delay2 = dispatch_time(DISPATCH_TIME_NOW, Int64((duration + 0.15 + 0.5) * Double(NSEC_PER_SEC)))
        dispatch_after(delay2, dispatch_get_main_queue()) { () -> Void in
            self.backgroundGroup.setBackgroundImage(nil)
            self.animateWithDuration(0.5, animations: {
                self.syncButton.setHeight(70)
                self.syncButton.setWidth(70)
            })
        }
    }
}
