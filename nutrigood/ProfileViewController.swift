//
//  ProfileViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/27/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var tableView:UITableView!
    @IBOutlet var profilePic:UIImageView!
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var profileName:String {
        get {
            return ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.configureUser()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "configureUserFromNotif:", name: constants.UserPhotoChangedNotification, object: nil);
    }
    
    private struct constants{
        static let infoSection = 0
        static let genderSection = 0
        static let infoSectionTitle = "Info"
        static let ReuseCellIdentifier = "resuseTableCell"
        static let DietaryGoalsSegue = "DIETARY_GOALS"
        static let UserPhotoChangedNotification = "UserPhotoChangedNotif"
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
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return constants.infoSectionTitle
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88 //#magic number looked up online
    }
    
    var pickerData:[String] = [String]()
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        if let cell = tableView.dequeueReusableCellWithIdentifier(constants.ReuseCellIdentifier, forIndexPath: indexPath) as? TableViewInfoCell{
            cell.infoLabel?.text = infoList[indexPath.row] //#fill in with the names of the sections
            cell.pickerTitles = pickerTitleOptions[indexPath.row]
            cell.infoPicker.delegate = cell
            cell.infoPicker.dataSource = cell
            
            let selectedRow = self.userDefaults.integerForKey(infoList[indexPath.row])
            cell.infoPicker.selectRow(selectedRow, inComponent: 0, animated: false)
            
            return cell
        }
        return tableView.dequeueReusableCellWithIdentifier(constants.ReuseCellIdentifier, forIndexPath: indexPath)
    }
    
    // MARK: - User Profile
    func getProfileImageIfExists() -> UIImage? {
        let fileUrl = getProfileImageSavePlace()
        if let profileImageURL = fileUrl where profileImageURL.checkResourceIsReachableAndReturnError(nil) {
            if let data = NSData(contentsOfURL: profileImageURL) {
                return UIImage(data: data)
            }
        }
        return nil
    }
    
    func getProfileImageSavePlace() -> NSURL? {
        let fileManager = NSFileManager()
        let urls:[NSURL] = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls.first?.URLByAppendingPathComponent("profileImage.jpg")
    }
    
    func configureUserFromNotif(sender:AnyObject) {
        self.configureUser()
    }
    
    // Configure the user profile
    private func configureUser() {
        // Check for local photo first, set it if it exists
        if let photo = getProfileImageIfExists() {
            self.profilePic.image = photo
            return
        } else {
            self.profilePic.image = UIImage(named: "Person")
        }
    }
    
    
    // Takes a photo and sets as profile pic if successful
    @IBAction func takePhoto(sender: UIButton) {
        let optionPicker = UIAlertController(title: "Snap a photo", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        // Allow user to take a photo
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            optionPicker.addAction(alertActionWithPickerType(.Camera, title: "Camera"))
        }
        
        // Allow user to choose from saved photos
        if (UIImagePickerController.isSourceTypeAvailable(.SavedPhotosAlbum)) {
            optionPicker.addAction(alertActionWithPickerType(.SavedPhotosAlbum, title: "Album"))
        }
        
        optionPicker.addAction(UIAlertAction(title: "Remove", style: .Destructive, handler: { action in
            do {
                let fileManager = NSFileManager()
                if let filePath = self.getProfileImageSavePlace() {
                    try fileManager.removeItemAtURL(filePath)
                    NSNotificationCenter.defaultCenter().postNotificationName(constants.UserPhotoChangedNotification, object: nil)
                }
            } catch {
                
            }
        }))
        optionPicker.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        presentViewController(optionPicker, animated: true, completion: nil)
    }
    
    // Add in a alert action option that triggers a UIImagePickerController
    private func alertActionWithPickerType(pickerType:UIImagePickerControllerSourceType, title:String) -> UIAlertAction {
        return UIAlertAction(title: title, style: .Default, handler: { action in
            let imgPicker = UIImagePickerController()
            imgPicker.allowsEditing = true
            imgPicker.delegate = self
            imgPicker.sourceType = pickerType
            imgPicker.navigationBar.translucent = true
            imgPicker.navigationBar.tintColor = UIColor.whiteColor()
            imgPicker.navigationBar.barTintColor = Colors.AppGreen
            imgPicker.navigationBar.titleTextAttributes = [
                NSForegroundColorAttributeName : UIColor.whiteColor(),
                NSFontAttributeName : UIFont.systemFontOfSize(18.0, weight: UIFontWeightLight),
            ]
            self.presentViewController(imgPicker, animated: true, completion: nil)
        })
    }
    
    // Called when the user confirms a photo
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        let fileUrl = getProfileImageSavePlace()
        if let fileUrl = fileUrl {
            UIImageJPEGRepresentation(image, 0.7)?.writeToURL(fileUrl, atomically: true)
            NSNotificationCenter.defaultCenter().postNotificationName(constants.UserPhotoChangedNotification, object: nil)
        }
        picker.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Called on cancel
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func watchNotif(sender: UIBarButtonItem) {
        let alert = UIAlertController.makeSimpleAlert("Synced", message: "Your biometrics are synced through your wearable device", actionText: "Ok")
        self.presentViewController(alert, animated: true, completion: nil)
    }

}
