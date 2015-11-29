//
//  NutritionChartsViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/20/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit
import Charts

class NutritionChartsViewController: UIViewController {

    @IBOutlet weak var calorieValue:UILabel!
    @IBOutlet weak var stackView: UIStackView!

    var calorieBarWidth:NSLayoutConstraint!
    var calories:Int = 0 {
        didSet {
            let percent = getPercentage(calories, maxTotal: 2000.0)
            self.calorieValue.text = "Cal: \(percent)%"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.carbChart.animate(xAxisDuration: 1.3, yAxisDuration: 1.3, easingOption: .EaseInOutBounce)
        self.fatChart.animate(xAxisDuration: 1.3, yAxisDuration: 1.3, easingOption: .EaseInOutBounce)
        self.proteinChart.animate(xAxisDuration: 1.3, yAxisDuration: 1.3, easingOption: .EaseInOutBounce)
        self.calorieChart.animate(yAxisDuration: 1.3)
        
        updateCharts()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateCharts", name: PublicConstants.UpdateNutrition, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateCharts", name: PublicConstants.CartUpdated, object: nil)
    }
    
    // Update the chart values
    func updateCharts() {
        var totalFat = 0.0
        var totalCarbs = 0.0
        var totalProtein = 0.0
        var totalCalories = 0
        for key in Database.cart.keys {
            for item in Database.cart[key]! {
                totalFat += item.fats
                totalCarbs += item.carbs
                totalProtein += item.protein
                totalCalories += item.calories
            }
        }
        
        let tooFat = updateFats(totalFat, maxFat: Profile.fats)
        let tooProtein = updateProtein(totalProtein, maxProtein: Profile.protein)
        let tooCarb = updateCarbs(totalCarbs, maxCarbs:Profile.carbs)
        updateCalories(totalCalories)
        
        var excess = ""
        excess = excess + (tooFat ? "\nfat" : "")
        excess = excess + (tooProtein ? "\nprotein" : "")
        excess = excess + (tooCarb ? "\ncarbs" : "")
        excess = excess + (totalCalories > 2500 ? "\ncalories" : "")
        if excess.characters.count > 0 {
            let alert = UIAlertController.makeSimpleAlert("Warning", message:"You have exceeded your daily recommended amount of:\(excess)", actionText:"OK")
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    private func updateFats(totalFat:Double, maxFat: Double) -> Bool{
        var tooFat = false
        let percent = getPercentage(totalFat, maxTotal: maxFat)
        fatChart.descriptionText = "Fat: \(percent)%"
        
        var dataEntries: [ChartDataEntry] = []
        
        var dataPoints = [totalFat]
        if (percent < 100) {
            dataPoints.append(maxFat - totalFat)
        } else {
            tooFat = true
        }
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: dataPoints[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let colors = [Colors.FatColor, Colors.EmptyColor]
        let chartDataSet = PieChartDataSet(yVals: dataEntries)
        chartDataSet.colors = colors
        chartDataSet.drawValuesEnabled = false
        chartDataSet.label = ""
        fatChart.data = PieChartData(xVals: [String](), dataSet: chartDataSet)
        return tooFat
    }
    
    private func updateCarbs(totalCarbs:Double, maxCarbs: Double) -> Bool {
        var tooManyCarbs = false
        let percent = getPercentage(totalCarbs, maxTotal: maxCarbs)
        carbChart.descriptionText = "Carbs: \(percent)%"
        
        var dataEntries: [ChartDataEntry] = []
        
        var dataPoints = [totalCarbs]
        if (percent < 100) {
            dataPoints.append(maxCarbs - totalCarbs)
        } else {
            tooManyCarbs = true
        }
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: dataPoints[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let colors = [Colors.CarbColor, Colors.EmptyColor]
        let chartDataSet = PieChartDataSet(yVals: dataEntries)
        chartDataSet.colors = colors
        chartDataSet.drawValuesEnabled = false
        chartDataSet.label = ""
        carbChart.data = PieChartData(xVals: [String](), dataSet: chartDataSet)
        return tooManyCarbs
    }
    
    private func updateProtein(totalProtein: Double, maxProtein: Double) -> Bool {
        var tooMuchProtein = false
        let percent = getPercentage(totalProtein, maxTotal: maxProtein)
        proteinChart.descriptionText = "Protein: \(percent)%"
        
        var dataEntries: [ChartDataEntry] = []
        
        var dataPoints = [totalProtein]
        if (percent < 100) {
            dataPoints.append(maxProtein - totalProtein)
        } else {
            tooMuchProtein = true
        }
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: dataPoints[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let colors = [Colors.ProteinColor, Colors.EmptyColor]
        let chartDataSet = PieChartDataSet(yVals: dataEntries)
        chartDataSet.colors = colors
        chartDataSet.drawValuesEnabled = false
        chartDataSet.label = ""
        proteinChart.data = PieChartData(xVals: [String](), dataSet: chartDataSet)
        return tooMuchProtein
    }
    
    private func updateCalories(totalCalories: Int) {
        let dataEntry = BarChartDataEntry(value: Double(totalCalories), xIndex: 0)
        let chartDataSet = BarChartDataSet(yVals: [dataEntry])
        chartDataSet.colors = [Colors.CalorieColor]
        calorieChart.data = BarChartData(xVals: [String](), dataSet: chartDataSet)
    }
    
    // MARK: - Chart Setup
    @IBOutlet weak var fatChart:PieChartView! {
        didSet {
            fatChart.holeRadiusPercent = 0.3
            fatChart.drawHoleEnabled = false
        }
    }
    
    @IBOutlet weak var carbChart:PieChartView! {
        didSet {
            carbChart.holeRadiusPercent = 0.3
            carbChart.drawHoleEnabled = false
        }
    }
    
    @IBOutlet weak var proteinChart:PieChartView! {
        didSet {
            proteinChart.holeRadiusPercent = 0.3
            proteinChart.drawHoleEnabled = false
        }
    }
    
    @IBOutlet weak var calorieChart:HorizontalBarChartView! {
        didSet {
            calorieChart.descriptionText = ""
            calorieChart.pinchZoomEnabled = false
            calorieChart.drawGridBackgroundEnabled = false
            
            calorieChart.drawValueAboveBarEnabled = true
            calorieChart.drawBarShadowEnabled = false
            
            calorieChart.leftAxis.customAxisMax = 2500.0
            calorieChart.leftAxis.customAxisMin = 0.0
            
            calorieChart.legend.enabled = false
            calorieChart.leftAxis.drawLabelsEnabled = false
            calorieChart.leftAxis.drawAxisLineEnabled = false
            calorieChart.leftAxis.drawGridLinesEnabled = false

            calorieChart.rightAxis.drawAxisLineEnabled = false
            calorieChart.rightAxis.drawGridLinesEnabled = false
            calorieChart.rightAxis.drawLabelsEnabled = false
            
        }
    }
    
    // MARK: Rounding functions
    private func getPercentage(value:Int, maxTotal:Double) -> Double {
        return round((Double(value)/maxTotal) * 100)/100
    }
    
    private func getPercentage(value:Double, maxTotal:Double) -> Double {
        return round((value/maxTotal) * 1000) / 10.0
    }
}
