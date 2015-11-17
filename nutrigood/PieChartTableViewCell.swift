//
//  PieChartTableViewCell.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/16/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit
import Charts

class PieChartTableViewCell: UITableViewCell {

    @IBOutlet weak var pieChartView:PieChartView! {
        didSet {
            self.pieChartView.descriptionText = ""
            self.pieChartView.holeRadiusPercent = 0.3
            
            var dataEntries: [ChartDataEntry] = []
            let dataPoints = [5.0, 10.0]
            for i in 0..<dataPoints.count {
                let dataEntry = BarChartDataEntry(value: dataPoints[i], xIndex: i)
                dataEntries.append(dataEntry)
            }
            
            let titles = ["hi", "hello"]
            let colors = [Colors.AppGreen, Colors.BlueBelize]
            let chartDataSet = PieChartDataSet(yVals: dataEntries)
            chartDataSet.colors = colors
            pieChartView.data = PieChartData(xVals: titles, dataSet: chartDataSet)
            
        }
    }
    
    
    
    
}
