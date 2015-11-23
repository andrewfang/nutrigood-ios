//
//  CartViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/20/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cart"
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateTable", name: PublicConstants.CartUpdated, object: nil)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private struct Constants {
        static let BreakfastSection = 0
        static let LunchSection = 1
        static let DinnerSection = 2
        static let Meals = [Database.CollectionNames.Breakfast, Database.CollectionNames.Lunch, Database.CollectionNames.Dinner]
    }
    
    @IBAction func checkOut(sender: UIBarButtonItem) {
        let totalItemCount = Database.cart[Database.CollectionNames.Breakfast]!.count + Database.cart[Database.CollectionNames.Lunch]!.count + Database.cart[Database.CollectionNames.Dinner]!.count
        
        var alert:UIAlertController
        if totalItemCount < 1 {
            alert = UIAlertController(title: "Error", message: "There are no items in your cart.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Continue Shopping", style: .Cancel, handler: nil))
        } else {
            alert = UIAlertController(title: "Confirmation", message: "Please confirm your purchase", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: { action in
                var totalProtein = 0.0
                var totalCarbs = 0.0
                var totalFats = 0.0
                var totalCalories = 0
                for meal in Constants.Meals {
                    for mealItem in Database.cart[meal] ?? [] {
                        mealItem.inCart = false
                        totalProtein += mealItem.protein
                        totalCarbs += mealItem.carbs
                        totalFats += mealItem.fats
                        totalCalories += mealItem.calories
                        Database.recents.insert(mealItem, atIndex: 0)
                    }
                    Database.cart[meal]?.removeAll()
                }
                let currNutritionData = [
                    PublicConstants.Protein:totalProtein,
                    PublicConstants.Carbs:totalCarbs,
                    PublicConstants.Fats:totalFats,
                    PublicConstants.Calories:totalCalories,
                    PublicConstants.Date:NSDate(timeIntervalSinceNow: 0)]
                let userDefaults = NSUserDefaults.standardUserDefaults()
                
                var nutritionData = userDefaults.arrayForKey(PublicConstants.NutritionDataKey)
                if (nutritionData == nil) {
                    nutritionData = [AnyObject]()
                } else if (nutritionData?.count > 4) {
                    nutritionData?.removeFirst()
                }
                nutritionData?.append(currNutritionData)
                
                userDefaults.setObject(nutritionData, forKey: PublicConstants.NutritionDataKey)
                
                self.notifyCartUpdated()
                self.showPurchasedAlert()
                self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
            }))
        }
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showPurchasedAlert() {
        let purchaseConfirmAlert = UIAlertController(title: "Thank You", message: "Your food will be delivered shortly.", preferredStyle: .Alert)
        purchaseConfirmAlert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
        self.presentViewController(purchaseConfirmAlert, animated: true, completion: nil)
    }
    
    func updateTable() {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Database.cart[Constants.Meals[section]]?.count ?? 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.Meals[section]
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as? SelectionTableViewCell {
            let food = Database.cart[Constants.Meals[indexPath.section]]![indexPath.row]
            
            cell.foodLabel.text = food.name
            cell.foodImg.image = UIImage(named: "testImage")
            
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)) {
                if let url = FoodItem.getImageURLFromFlickrWithSearchQuery(food.name) {
                    if let data = NSData(contentsOfURL: url) {
                        dispatch_async(dispatch_get_main_queue()){
                            cell.foodImg.image = UIImage(data: data)
                        }
                    }
                }
            }
            
            return cell
        }
        return tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
    }
    
    /* Allow delete */
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    /* Handle delete */
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let food = Database.cart[Constants.Meals[indexPath.section]]![indexPath.row]
            Database.removeFromCart(food)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            self.notifyCartUpdated()
        }
    }
    
    private func notifyCartUpdated() {
        NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: PublicConstants.CartUpdated, object: nil))
    }

}
