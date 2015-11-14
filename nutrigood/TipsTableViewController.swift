//
//  TipsTableViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/12/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class TipsTableViewController: UITableViewController {

    var chats:[ChatItem] = []
    
    private struct Constants {
        static let UserCell = "meCell"
        static let AICell = "youCell"
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
        
        var cell:UITableViewCell
        let chatItem = chats[indexPath.item]
        
        // Different chat type for different user
        if chatItem.type == ChatType.AI {
            cell = tableView.dequeueReusableCellWithIdentifier(Constants.AICell, forIndexPath: indexPath)
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier(Constants.UserCell, forIndexPath: indexPath)
        }
        
        // Set the text to be the chat item's content
        if let cell = cell as? ChatTableViewCell {
            cell.content.text = chatItem.content
        }

        cell.layoutIfNeeded()
        
        return cell
    }
    
    @IBAction func sayRandomTip(sender: UIButton) {
        if let buttonText = sender.titleLabel?.text {
            self.chats.append(ChatItem(content: buttonText, type: .User))
        }
        self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.chats.count - 1, inSection: 0)], withRowAnimation: .Fade)
        
        let tip = Database.getRandomTip()
        self.chats.append(ChatItem(content: tip, type: .AI))
        self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.chats.count - 1, inSection: 0)], withRowAnimation: .Fade)
    }
}
