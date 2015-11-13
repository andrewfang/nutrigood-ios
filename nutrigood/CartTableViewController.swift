//
//  CartTableViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/12/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cart"
    }
    
    struct PublicConstants {
        static let CartUpdated = "CartUpdated"
    }
    
    private struct Constants {
        static let BreakfastSection = 0
        static let LunchSection = 1
        static let DinnerSection = 2
        static let Meals = [Database.CollectionNames.Breakfast, Database.CollectionNames.Lunch, Database.CollectionNames.Dinner]
    }
    
    @IBAction func checkOut(sender: UIButton) {
        let totalItemCount = Database.cart[Database.CollectionNames.Breakfast]!.count + Database.cart[Database.CollectionNames.Lunch]!.count + Database.cart[Database.CollectionNames.Dinner]!.count
        
        var alert:UIAlertController
        if totalItemCount < 1 {
            alert = UIAlertController(title: "Error", message: "There are no items in your cart.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Continue Shopping", style: .Cancel, handler: nil))
        } else {
            alert = UIAlertController(title: "Confirmation", message: "Please confirm your purchase", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: { action in
                for meal in Constants.Meals {
                    for mealItem in Database.cart[meal] ?? [] {
                        mealItem.inCart = false
                        Database.recents.insert(mealItem, atIndex: 0)
                    }
                    Database.cart[meal]?.removeAll()
                }
                self.notifyCartUpdated()
            }))
        }
        presentViewController(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Database.cart[Constants.Meals[section]]?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.Meals[section]
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88.0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        let food = Database.cart[Constants.Meals[indexPath.section]]![indexPath.row]
        cell.imageView?.image = food.image
        cell.textLabel?.text = food.name

        return cell
    }
    
    /* Allow delete */
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    /* Handle delete */
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
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
//    /* Handle detail disclosure button press */
//    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
//        let cell = tableView.cellForRowAtIndexPath(indexPath)
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
