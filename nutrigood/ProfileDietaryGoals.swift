//
//  ProfileDietaryGoals.swift
//  nutrigood
//
//  Created by Jorge Garcia Mesa on 11/18/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class ProfileDietaryGoals: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dietary Goals"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: -- the weak linkes 
    
    @IBOutlet weak var textBoxValue: UITextField!
    @IBAction func sliderUpdate(sender: AnyObject) {
    
    }
    
    private struct Constants {
        static let MaxIntakeSection = 0
        static let DietaryRestrictSection = 1
        static let MaxIntakeSectionTitle = "Max Intake Per Day"
        static let DietaryRestrictSectionTitle = "Dietary Restrictions"
        static let ReuseCellIdentifier = "DietaryGoalsSlider"
        static let SwitchCellIdentifier = "DietaryGoalsSwitch"
        static let MoreCellIdentifier = "DietaryGoalsMore"
        static let DietaryGoalsSegue = "MORE_RESTRICTIONS"
    }
    
    //# Arrays containing the names fo the categories
    private var intakeList: [String] = ["Calories","Fats", "Carbs", "Sugars"]
    
    private var restrictionsList: [String] = ["Vegetarian","Vegan", "More"]

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch(section){
        case Constants.MaxIntakeSection:
            return 4
        case Constants.DietaryRestrictSection:
            return 3
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch (section) {
        case Constants.MaxIntakeSection:
            return Constants.MaxIntakeSectionTitle
        case Constants.DietaryRestrictSection:
            return Constants.DietaryRestrictSectionTitle
        default:
            return ""
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch (indexPath.section) {
        case Constants.MaxIntakeSection:
            return 44
        case Constants.DietaryRestrictSection:
            return 44
        default:
            return 44
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        // have to return something so this is just a basic example
        
        switch (indexPath.section) {
        case Constants.MaxIntakeSection:
            if let cell = tableView.dequeueReusableCellWithIdentifier(Constants.ReuseCellIdentifier, forIndexPath: indexPath) as? TableViewSliderCell{
                cell.IntakeLabel?.text = intakeList[indexPath.row]
                return cell
            }
        case Constants.DietaryRestrictSection:
            if let cell = tableView.dequeueReusableCellWithIdentifier(Constants.SwitchCellIdentifier, forIndexPath: indexPath) as? TableViewSwitchCell{
            cell.SwitchLabel?.text = restrictionsList[indexPath.row]
            return cell
            }
        default:
            break
        }
        return tableView.dequeueReusableCellWithIdentifier(Constants.SwitchCellIdentifier, forIndexPath: indexPath)
    }
    
    //        if (indexPath.row < 4){
    //            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.ReuseCellIdentifier, forIndexPath: indexPath)
    //            cell.textLabel?.text = intakeList[indexPath.row]
    //            return cell
    //        } else {
    //            let cell = tableView.dequeueReusableCellWithIdentifier(Constants.SwitchCellIdentifier, forIndexPath: indexPath)
    //            cell.textLabel?.text = intakeList[indexPath.row]
    //            return cell
    //        }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier(Constants.DietaryGoalsSegue, sender: restrictionsList[2])
    }

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
