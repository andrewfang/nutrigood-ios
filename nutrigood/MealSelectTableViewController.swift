//
//  MealSelectTableViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/12/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class MealSelectTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meals"
    }
    
    private struct Constants {
        static let SelectSection = 0
        static let MealSection = 1
        static let SelectSectionTitle = "Quick Select"
        static let MealSectionTitle = "Meals"
        static let ReuseCellIdentifier = "reuseIdentifier"
        static let SelectOptions = [Database.CollectionNames.Recents, Database.CollectionNames.Favorites]
        static let MealOptions = [Database.CollectionNames.Breakfast, Database.CollectionNames.Lunch, Database.CollectionNames.Dinner]
        static let MealSelectSegue = "MEAL_SEGUE"
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case Constants.SelectSection:
            return 2
        case Constants.MealSection:
            return 3
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case Constants.SelectSection:
            return Constants.SelectSectionTitle
        case Constants.MealSection:
            return Constants.MealSectionTitle
        default:
            return ""
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch (indexPath.section) {
        case Constants.SelectSection:
            return 44
        case Constants.MealSection:
            return 88
        default:
            return 44
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(Constants.ReuseCellIdentifier, forIndexPath: indexPath) as? SelectionTableViewCell {
            switch (indexPath.section) {
            case Constants.SelectSection:
                cell.textLabel?.text = Constants.SelectOptions[indexPath.row]
            case Constants.MealSection:
                let mealName = Constants.MealOptions[indexPath.row]
                cell.foodLabel.text = mealName
                cell.foodImg.image = UIImage(named: "testImage")
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)) {
                    if let url = FoodItem.getImageURLFromFlickrWithSearchQuery(mealName) {
                        if let data = NSData(contentsOfURL: url) {
                            dispatch_async(dispatch_get_main_queue()){
                                cell.foodImg.image = UIImage(data: data)
                            }
                        }
                    }
                }
                
            default:
                break
            }
            return cell
        }
        
        return tableView.dequeueReusableCellWithIdentifier(Constants.ReuseCellIdentifier, forIndexPath: indexPath)
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.section) {
        case Constants.SelectSection:
            performSegueWithIdentifier(Constants.MealSelectSegue, sender: Constants.SelectOptions[indexPath.row])
        case Constants.MealSection:
            performSegueWithIdentifier(Constants.MealSelectSegue, sender: Constants.MealOptions[indexPath.row])
        default:
            break
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == Constants.MealSelectSegue) {
            if let vc = segue.destinationViewController as? FoodSelectTableViewController,
                let collectionType = sender as? String {
                    
                    vc.collectionType = collectionType
                    
                    switch(collectionType) {
                    case Database.CollectionNames.Recents:
                        vc.items = Database.recents
                    case Database.CollectionNames.Favorites:
                        vc.items = Database.favorites
                    case Database.CollectionNames.Breakfast:
                        vc.items = Database.breakfasts
                    case Database.CollectionNames.Lunch:
                        vc.items = Database.lunches
                    case Database.CollectionNames.Dinner:
                        vc.items = Database.dinners
                    default:
                        break
                    }
            }
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
