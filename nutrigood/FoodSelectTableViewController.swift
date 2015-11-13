//
//  FoodSelectTableViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/12/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class FoodSelectTableViewController: UITableViewController {

    var items:[FoodItem] = []
    var collectionType:String!
    
    private struct Constants {
        static let ShowFoodSegue = "SHOW_FOOD"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.collectionType
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateTableItems", name: CartTableViewController.PublicConstants.CartUpdated, object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if (items.count == 0) {
            // Tell the user if no items are found for the given category
            let alert = UIAlertController(title: "No Items Found", message: "Sorry, we couldn't find any entries for \(self.collectionType.lowercaseString)", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }

    func updateTableItems() {
        self.tableView.reloadData()
    }
    
    // MARK: Table view Controls
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as? FoodTableViewCell {
            cell.foodItem = items[indexPath.row]
            return cell
        } else {
            return tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        }
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(Constants.ShowFoodSegue, sender: self.items[indexPath.row])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.ShowFoodSegue {
            if let vc = segue.destinationViewController as? FoodDetailsViewController,
                let item = sender as? FoodItem {
                    vc.item = item
            }
        }
    }

}
