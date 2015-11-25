//
//  ProfileTableViewController.swift
//  nutrigood
//
//  Created by Jorge Garcia Mesa on 11/12/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
    var profileName:String {
        get {
            return ""
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
    }
    
    private struct constants{
        static let infoSection = 0
        static let genderSection = 0
        static let infoSectionTitle = "Info"
        static let ReuseCellIdentifier = "resuseTableCell"
        static let DietaryGoalsSegue = "DIETARY_GOALS"
    }
    
    private var infoList: [String] = ["Age","Gender", "Weight (lb)", "Height (In)"]
    private var genderValues: [String] = ["54", "Male", "190 lb", "72 in"]
    private var pickerTitleOptions = [["20-30","31-40","41-50","51-60","61-70","71-80"],["Female", "Male","Other"],["100-110","111-120","121-130","131-140","141-150","151-160","161-170","171-180","181-190","191-200","201-210","211-220","221-230","231-240","241-250",
        "251-260","261-270","271-280","281-290","291-300"],["60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78"]]
    
    //# the action
    @IBAction func DietaryGoalClick(sender: AnyObject) {
        performSegueWithIdentifier(constants.DietaryGoalsSegue,sender: nil)
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return constants.infoSectionTitle
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88 //#magic number looked up online
    }
    
    var pickerData:[String] = [String]()
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if let cell = tableView.dequeueReusableCellWithIdentifier(constants.ReuseCellIdentifier, forIndexPath: indexPath) as? TableViewInfoCell{
            cell.infoLabel?.text = infoList[indexPath.row] //#fill in with the names of the sections
            cell.pickerTitles = pickerTitleOptions[indexPath.row]
            cell.infoPicker.delegate = cell
            cell.infoPicker.dataSource = cell
            return cell
        }
        return tableView.dequeueReusableCellWithIdentifier(constants.ReuseCellIdentifier, forIndexPath: indexPath)
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
