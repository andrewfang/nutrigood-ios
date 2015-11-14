//
//  TipsTableViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/12/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class TipsTableViewController: UITableViewController {

    var chats:[String] = []
    private struct Constants {
        static let MeCell = "meCell"
        static let YouCell = "youCell"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tips"
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100.0
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.YouCell, forIndexPath: indexPath)
        if let cell = cell as? ChatTableViewCell {
            cell.content.text = chats[indexPath.item]
        }
        
        cell.layoutIfNeeded()
        
        return cell
    }
    
    @IBAction func sayRandomTip() {
        let tip = Database.getRandomTip()
        self.chats.append(tip)
        self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.chats.count - 1, inSection: 0)], withRowAnimation: .Fade)
    }
}
