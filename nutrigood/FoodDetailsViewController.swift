//
//  FoodDetailsViewController.swift
//  nutrigood
//
//  Created by Andrew Fang on 11/12/15.
//  Copyright © 2015 Fang Industries. All rights reserved.
//

import UIKit
import Charts

class FoodDetailsViewController: UIViewController {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var nutritionChart: BarChartView!
    @IBOutlet weak var allergenLabel: UILabel!
    
    var item: FoodItem!
    
    @IBAction func addToCart(sender: UIButton) {
        self.item.inCart = !self.item.inCart
        if (self.item.inCart) {
            self.addButton.setImage(UIImage(named: "added"), forState: .Normal)
            Database.addToCart(self.item)
        } else {
            self.addButton.setImage(UIImage(named: "add"), forState: .Normal)
            Database.removeFromCart(self.item)
        }
        NSNotificationCenter.defaultCenter().postNotificationName(PublicConstants.UpdateNutrition, object: nil)
    }
    
    @IBAction func markFav(sender: UIButton) {
        
        if (self.item.isFav) {
            self.favButton.setImage(UIImage(named: "fav"), forState: .Normal)
            Database.removeFromFav(self.item)
        } else {
            
            self.favButton.setImage(UIImage(named: "faved"), forState: .Normal)
            Database.addToFav(self.item)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the item
        self.foodNameLabel.text = self.item.name
        if (self.item.image != nil) {
            self.foodImage.image = self.item.image
        } else {
            self.foodImage.image = UIImage(named: "testImage")!
            let name = self.item.name
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, 0)) {
                if let url = FoodItem.getImageURLFromFlickrWithSearchQuery(self.item.name) {
                    if let data = NSData(contentsOfURL: url) {
                        dispatch_async(dispatch_get_main_queue()){
                            if (self.item.name == name) {
                                let flickrImage = UIImage(data: data)
                                self.foodImage.image = flickrImage
                                self.item.image = flickrImage
                            }
                        }
                    }
                }
            }
        }
        
        if (self.item.isFav) {
            self.favButton.setImage(UIImage(named: "faved"), forState: .Normal)
        } else {
            self.favButton.setImage(UIImage(named: "fav"), forState: .Normal)
        }
        
        if (self.item.inCart) {
            self.addButton.setImage(UIImage(named: "added"), forState: .Normal)
        } else {
            self.addButton.setImage(UIImage(named: "add"), forState: .Normal)
        }
        setupNutritionChart()
        setupAllergens()
    }
    
    private func setupNutritionChart() {
        self.nutritionChart.descriptionText = ""
        self.nutritionChart.rightAxis.drawLabelsEnabled = false
        self.nutritionChart.legend.enabled = false
        self.nutritionChart.pinchZoomEnabled = true
        self.nutritionChart.drawGridBackgroundEnabled = false
        self.nutritionChart.xAxis.labelPosition = .Bottom
        self.nutritionChart.drawValueAboveBarEnabled = false
        
        let vf = NSNumberFormatter()
        vf.maximumFractionDigits = 1
        vf.positiveSuffix = "%"
        self.nutritionChart.leftAxis.valueFormatter = vf
        let maxProtein = Profile.protein
        let maxCarbs = Profile.carbs
        let maxFats = Profile.fats
        let maxCalories = Double(Profile.calories)
        
        var dataEntries: [ChartDataEntry] = []
        let dataPoints = [getPercentage(Double(self.item.calories), maxTotal: maxCalories), getPercentage(self.item.fats, maxTotal: maxFats), getPercentage(self.item.protein, maxTotal: maxProtein),  getPercentage(self.item.carbs, maxTotal: maxCarbs)]
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: dataPoints[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let colors = [Colors.CalorieColor, Colors.FatColor, Colors.ProteinColor, Colors.CarbColor]
        let chartDataSet = BarChartDataSet(yVals: dataEntries)
        chartDataSet.colors = colors
        nutritionChart.data = BarChartData(xVals: ["Cal: \(self.item.calories)", "Fat: \(self.item.fats)g", "Prot: \(self.item.fats)g", "Carb: \(self.item.carbs)g"], dataSet: chartDataSet)
    }
    
    private func setupAllergens() {
        var allergens = ""
        for allergen in self.item.allergens {
           allergens = allergens + (PublicConstants.AllergenDict[allergen] ?? "")
        }
        self.allergenLabel.text = allergens
        
    }
    
    private func getPercentage(value:Double, maxTotal:Double) -> Double {
        return round((value/maxTotal) * 1000) / 10.0
    }

}
