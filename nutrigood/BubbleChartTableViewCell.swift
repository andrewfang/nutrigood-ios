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
            
            var dataEntries: [ChartDataEntry] = []
            var dataEntries2: [ChartDataEntry] = []
            
            let dataPoints = [5.0, 10.0, 2.0]
            let dataPoints2 = [2.0, 8.0, 4.0]
            for i in 0..<dataPoints.count {
                let dataEntry = BubbleChartDataEntry(xIndex: i, value: dataPoints[i], size: CGFloat(dataPoints[i]))
                dataEntries.append(dataEntry)
            }
            
            for i in 0..<dataPoints2.count {
                let dataEntry = BubbleChartDataEntry(xIndex: i, value: dataPoints2[i], size: CGFloat(dataPoints2[i]))
                dataEntries2.append(dataEntry)
            }
            
            
            let titles = ["Date1", "Date2", "Date3"]
            let chartDataSet = BubbleChartDataSet(yVals: dataEntries, label: "Fats")
            chartDataSet.colors = [Colors.RedAlizarin]
            
            let chartDataSet2 = BubbleChartDataSet(yVals: dataEntries2, label: "Calories")
            chartDataSet2.colors = [Colors.OrangeCarrot]
            
            
            bubbleChartView.data = BubbleChartData(xVals: titles, dataSets: [chartDataSet, chartDataSet2])
        }
    }

}
