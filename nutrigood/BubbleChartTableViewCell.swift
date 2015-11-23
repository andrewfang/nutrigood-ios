//
//  BubbleChartTableViewCell.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/16/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit
import Charts

class BubbleChartTableViewCell: UITableViewCell {

    @IBOutlet weak var bubbleChartView:BubbleChartView! {
        didSet {
            self.bubbleChartView.setScaleEnabled(false)
            self.bubbleChartView.descriptionText = ""
            self.bubbleChartView.drawGridBackgroundEnabled = false
            self.bubbleChartView.dragEnabled = true
            self.bubbleChartView.leftAxis.drawLabelsEnabled = false
            self.bubbleChartView.rightAxis.drawLabelsEnabled = false
            self.bubbleChartView.animate(yAxisDuration: 1.3, easingOption: .EaseInBounce)
            self.setUpData()
        }
    }
    
    func setUpData() {
        var proteins: [ChartDataEntry] = []
        var fats: [ChartDataEntry] = []
        var carbs: [ChartDataEntry] = []
        var calories: [ChartDataEntry] = []
        var dates: [String] = []
        
        // TODO: get max protein. also fix in NutritionChartsViewController
        let maxProtein = 56.0
        let maxCarbs = 310.0
        let maxFats = 65.0
        let maxCalories = 2500.0
        
        let data = NSUserDefaults.standardUserDefaults().arrayForKey(PublicConstants.NutritionDataKey)
        guard let nutritionData = data as? [NSDictionary] else {
            return
        }
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .NoStyle
        
        for i in 0..<nutritionData.count {
            let proteinPercent = nutritionData[i][PublicConstants.Protein] as? Double ?? 0.0 / maxProtein
            let pEntry = BubbleChartDataEntry(xIndex: i, value: proteinPercent, size: CGFloat(proteinPercent))
            proteins.append(pEntry)
            
            let fatPercent = nutritionData[i][PublicConstants.Fats] as? Double ?? 0.0 / maxFats
            let fEntry = BubbleChartDataEntry(xIndex: i, value: fatPercent, size: CGFloat(fatPercent))
            fats.append(fEntry)
            
            let carbPercent = nutritionData[i][PublicConstants.Carbs] as? Double ?? 0.0 / maxCarbs
            let carbEntry = BubbleChartDataEntry(xIndex: i, value: carbPercent, size: CGFloat(carbPercent))
            carbs.append(carbEntry)
            
            let calPercent = Double(nutritionData[i][PublicConstants.Calories] as? Int ?? 0) / maxCalories
            let calEntry = BubbleChartDataEntry(xIndex: i, value: calPercent, size: CGFloat(calPercent))
            calories.append(calEntry)
            
            dates.append(dateFormatter.stringFromDate(nutritionData[i][PublicConstants.Date] as? NSDate ?? NSDate(timeIntervalSinceNow: 0)))
        }
        
        let fatDataSet = BubbleChartDataSet(yVals: fats, label: "Fats")
        fatDataSet.colors = [Colors.FatColor]
        
        let carbDataSet = BubbleChartDataSet(yVals: carbs, label: "Carbs")
        carbDataSet.colors = [Colors.CarbColor]
        
        let proteinDataSet = BubbleChartDataSet(yVals: proteins, label: "Protein")
        proteinDataSet.colors = [Colors.ProteinColor]
        
        let calDataSet = BubbleChartDataSet(yVals: calories, label: "Calories")
        calDataSet.colors = [Colors.CalorieColor]
        
        bubbleChartView.data = BubbleChartData(xVals: dates, dataSets: [fatDataSet, carbDataSet, proteinDataSet, calDataSet])
    }

}
