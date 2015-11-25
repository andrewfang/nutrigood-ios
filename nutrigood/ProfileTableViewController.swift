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
    
    private var infoList: [String] = ["Age","Gender", "Weight", "Height"]
    private var genderValues: [String] = ["54", "Male", "190 lb", "72 in"]
//    private var age = []
//    private var gender = ["Female", "Male","Other"] //should think about other genders
//    private var weight = []
//    private var height = []
    
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
        return 44 //#magic number looked up online
    }
    
    var pickerData:[String] = [String]()
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if let cell = tableView.dequeueReusableCellWithIdentifier(constants.ReuseCellIdentifier, forIndexPath: indexPath) as? TableViewInfoCell{
            cell.infoLabel?.text = infoList[indexPath.row] //#fill in with the names of the sections
            cell.pickerTitles = ["Male", "Female"]
            
            cell.infoPicker.delegate = cell
            cell.infoPicker.dataSource = cell
            return cell
        }
        return tableView.dequeueReusableCellWithIdentifier(constants.ReuseCellIdentifier, forIndexPath: indexPath)
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        performSegueWithIdentifier(constants.DietaryGoalsSegue, sender: <#T##AnyObject?#>)
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
