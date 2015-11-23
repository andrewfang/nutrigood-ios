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
        static let BubbleChartReuseIdentifier = "bubbleChartCell"
        static let LineChartReuseIdentifier = "lineChartCell"
        static let Titles = ["", "Caloric Intake", "Carb Intake", "Protein Intake", "Fat Intake"]
        static let Nutrients = ["", PublicConstants.Calories, PublicConstants.Carbs, PublicConstants.Protein, PublicConstants.Fats]
        static let ChartColors:[UIColor] = [UIColor.clearColor(), Colors.CalorieColor, Colors.CarbColor, Colors.ProteinColor, Colors.FatColor]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Data"
        if let bkgd = UIImage(named: "chatBackground") {
            self.view.layer.contents = bkgd.CGImage
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateCharts", name: PublicConstants.CartUpdated, object: nil)
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.item == 0) {
            if let bubbleCell = tableView.dequeueReusableCellWithIdentifier(Constants.BubbleChartReuseIdentifier, forIndexPath: indexPath) as? BubbleChartTableViewCell {
                bubbleCell.setUpData()
                return bubbleCell
            }
        } else {
            if let lineCell = tableView.dequeueReusableCellWithIdentifier(Constants.LineChartReuseIdentifier, forIndexPath: indexPath) as? LineChartTableViewCell {
                lineCell.chartTitleLabel.text = Constants.Titles[indexPath.item]
                lineCell.chartColor = Constants.ChartColors[indexPath.item]
                lineCell.dateSet = getDateSet()
                
                let dataset = getDataSet(Constants.Nutrients[indexPath.item])
                
                lineCell.setupData(dataset)
                return lineCell
            }
        }
        
        // default
        return tableView.dequeueReusableCellWithIdentifier(Constants.LineChartReuseIdentifier, forIndexPath: indexPath)
    }
    
    private func getDataSet(nutrient:String) -> [Double] {
        var result = [Double]()
        
        let data = NSUserDefaults.standardUserDefaults().arrayForKey(PublicConstants.NutritionDataKey)
        guard let nutritionData = data as? [NSDictionary] else {
            return result
        }
        
        for i in 0..<nutritionData.count {
            result.append(nutritionData[i][nutrient] as? Double ?? 0.0)
        }
        
        return result
    }
    
    private func getDateSet() -> [String] {
        var result = [String]()
        let data = NSUserDefaults.standardUserDefaults().arrayForKey(PublicConstants.NutritionDataKey)
        guard let nutritionData = data as? [NSDictionary] else {
            return result
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .NoStyle
        
        for i in 0..<nutritionData.count {
            let date = nutritionData[i][PublicConstants.Date] as? NSDate ?? NSDate(timeIntervalSinceNow: 0)
            result.append(dateFormatter.stringFromDate(date))
        }
        
        return result
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
    
    func updateCharts() {
        self.tableView.reloadData()
    }

}
