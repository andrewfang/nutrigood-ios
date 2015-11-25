//
//  LineChartTableViewCell.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/23/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit
import Charts

class LineChartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var chartTitleLabel: UILabel!
    @IBOutlet weak var lineChartView:LineChartView! {
        didSet {
            self.lineChartView.noDataText = ""
            self.lineChartView.descriptionText = ""
            self.lineChartView.drawGridBackgroundEnabled = false
            self.lineChartView.legend.enabled = false
            self.lineChartView.pinchZoomEnabled = false
            self.lineChartView.leftAxis.drawLabelsEnabled = false
            self.lineChartView.rightAxis.drawLabelsEnabled = false
            self.lineChartView.animate(xAxisDuration:1.3, yAxisDuration: 1.3, easingOption: .EaseInOutQuart)
        }
    }
    
    var dateSet:[String]!
    var chartColor: UIColor = UIColor.clearColor()
    
    func setupData(points:[Double]) {
        var dataEntries: [ChartDataEntry] = []
        let dataPoints = points
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: dataPoints[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let colors = [chartColor]
        let chartDataSet = LineChartDataSet(yVals: dataEntries)
        chartDataSet.circleColors = colors
        chartDataSet.colors = colors
        lineChartView.data = LineChartData(xVals: self.dateSet, dataSet: chartDataSet)
    }

}
