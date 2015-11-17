//
//  DataTableViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/16/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit

class DataTableViewController: UITableViewController {

    private struct Constants {
        static let PieChartReuseIdentifier = "pieChartCell"
        static let BubbleChartReuseIdentifier = "bubbleChartCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Data"
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.item == 0) {
            if let pieCell = tableView.dequeueReusableCellWithIdentifier(Constants.PieChartReuseIdentifier, forIndexPath: indexPath) as? PieChartTableViewCell {
                
                return pieCell
            }
        } else {
            if let bubbleCell = tableView.dequeueReusableCellWithIdentifier(Constants.BubbleChartReuseIdentifier, forIndexPath: indexPath) as? BubbleChartTableViewCell {
                
                return bubbleCell
            }
        }
        
        // default
        return tableView.dequeueReusableCellWithIdentifier(Constants.PieChartReuseIdentifier, forIndexPath: indexPath)
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }

}
