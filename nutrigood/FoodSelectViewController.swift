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
    @IBOutlet weak var sortView: UIView!
    @IBOutlet weak var sortByLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.title = self.collectionType
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateItems", name: PublicConstants.CartUpdated, object: nil)
    }
    
    var items:[FoodItem] = []
    var collectionType:String!
    var sortVisible = false
    
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
        self.collectionView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.toggleSortView(true)
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
    
    
    // MARK: Sort Actions
    @IBAction func showSort(sender: UIBarButtonItem) {
        if (self.sortVisible) {
            self.toggleSortView(true)
        } else {
            self.toggleSortView(false)
        }
    }
    
    @IBAction func sortByAlphaBetical(sender: UIButton) {
        self.sortByNutrient("name")
    }
    
    @IBAction func sortByCalories(sender: UIButton) {
        self.sortByNutrient("calories")
    }
    
    @IBAction func sortByProtein(sender: UIButton) {
        self.sortByNutrient("protein")
    }
    
    @IBAction func sortByCarbs(sender: UIButton) {
        self.sortByNutrient("carbs")
    }
    
    @IBAction func sortByFats(sender: UIButton) {
        self.sortByNutrient("fats")
    }
    
    private func toggleSortView(shouldHide:Bool) {
        let height = CGFloat(shouldHide ? 0 : 40)
        UIView.animateWithDuration(0.3, animations: {
            var newFrame = self.sortView.frame
            newFrame.size.height = height
            self.sortView.frame = newFrame
            self.sortView.alpha = height / 40.0
        })
        self.sortVisible = !shouldHide
    }
    
    private func sortByNutrient(nutrient:String) {
        switch (nutrient) {
        case "calories":
            self.items = self.items.sort({$0.calories < $1.calories})
        case "fats":
            self.items = self.items.sort({$0.fats < $1.fats})
        case "carbs":
            self.items = self.items.sort({$0.carbs < $1.carbs})
        case "protein":
            self.items = self.items.sort({$0.protein < $1.protein})
        case "name":
            self.items = self.items.sort({$0.name < $1.name})
        default:
            break
        }
        self.sortByLabel.text = "Sorted by \(nutrient)"
//        self.toggleSortView(true)
        self.collectionView.reloadData()
    }

}
