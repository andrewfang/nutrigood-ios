//
//  FoodSelectViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/20/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class FoodSelectViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.title = self.collectionType
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateItems", name: CartViewController.PublicConstants.CartUpdated, object: nil)
    }
    
    var items:[FoodItem] = []
    var collectionType:String!
    
    private struct Constants {
        static let ShowFoodSegue = "SHOW_FOOD"
        static let CellIdentifier = "FOOD_ITEM_CELL"
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
    
    func updateItems() {
        self.collectionView.reloadData()
    }
    
    // MARK: Table view Controls
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Constants.CellIdentifier, forIndexPath: indexPath) as? FoodCollectionViewCell {
            cell.foodItem = items[indexPath.row]
            return cell
        } else {
            return collectionView.dequeueReusableCellWithReuseIdentifier(Constants.CellIdentifier, forIndexPath: indexPath)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
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
