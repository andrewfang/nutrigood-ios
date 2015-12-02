//
//  MealSelectViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/20/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit
import Charts

class MealSelectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Meals"
        self.tableView.dataSource = self
        self.tableView.delegate = self
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
        static let ChartEmbed = "ChartEmbed"
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch (section) {
        case Constants.SelectSection:
            return 2
        case Constants.MealSection:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case Constants.SelectSection:
            return Constants.SelectSectionTitle
        case Constants.MealSection:
            return Constants.MealSectionTitle
        default:
            return ""
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch (indexPath.section) {
        case Constants.SelectSection:
            return 44
        case Constants.MealSection:
            return 88
        default:
            return 44
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier(Constants.ReuseCellIdentifier, forIndexPath: indexPath) as? SelectionTableViewCell {
            switch (indexPath.section) {
            case Constants.SelectSection:
                cell.textLabel?.text = Constants.SelectOptions[indexPath.row]
                cell.imageView?.image = nil
                cell.foodImg.image = nil
                cell.foodLabel.text = nil
            case Constants.MealSection:
                let mealName = Constants.MealOptions[indexPath.row]
                cell.textLabel?.text = nil
                cell.imageView?.image = nil
                cell.foodLabel.text = mealName
                cell.foodImg.image = UIImage(named: "testImage")
                dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)) {
                    if let url = FoodItem.getImageURLFromFlickrWithSearchQuery(mealName + " meal") {
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.section) {
        case Constants.SelectSection:
            performSegueWithIdentifier(Constants.MealSelectSegue, sender: Constants.SelectOptions[indexPath.row])
        case Constants.MealSection:
            performSegueWithIdentifier(Constants.MealSelectSegue, sender: Constants.MealOptions[indexPath.row])
        default:
            break
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == Constants.MealSelectSegue) {
            if let vc = segue.destinationViewController as? FoodSelectViewController,
                let collectionType = sender as? String {
                    
                    vc.collectionType = collectionType
                    
                    switch(collectionType) {
                    case Database.CollectionNames.Recents:
                        vc.items = Database.recents
                    case Database.CollectionNames.Favorites:
                        vc.items = Database.favorites
                    case Database.CollectionNames.Breakfast:
                        vc.items = Database.filteredMeal(Database.CollectionNames.Breakfast)
                    case Database.CollectionNames.Lunch:
                        vc.items = Database.filteredMeal(Database.CollectionNames.Lunch)
                    case Database.CollectionNames.Dinner:
                        vc.items = Database.filteredMeal(Database.CollectionNames.Dinner)
                    default:
                        break
                    }
            }
            
        }
    }
    
    @IBAction func watchNotif(sender: UIBarButtonItem) {
        let alert = UIAlertController.makeSimpleAlert("Synced", message: "Your biometrics are synced through your wearable device", actionText: "Ok")
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}
