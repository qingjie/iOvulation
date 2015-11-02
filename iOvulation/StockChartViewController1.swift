//
//  StockChartViewController1.swift
//  iOvulation
//
//  Created by qingjiezhao on 7/28/15.
//  Copyright (c) 2015 qingjiezhao. All rights reserved.
//

import UIKit

class StockChartViewController1: UIViewController , ChartDelegate {
    
    var itemString:String?
//    @IBOutlet weak var labelLeadingMarginConstraint: NSLayoutConstraint!
//    private var labelLeadingMarginInitialConstant: CGFloat!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var chart: Chart!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleDict = [NSForegroundColorAttributeName: UIColor.orangeColor()] as [String : AnyObject]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict
        
        // Do any additional setup after loading the view, typically from a nib.
        //lblName.text = itemString
        print("hello")
        
//        labelLeadingMarginInitialConstant =  labelLeadingMarginConstraint.constant
        initializeChart()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeChart() {
        chart.delegate = self
        
        // Initialize data series and labels
        let stockValues = getStockValues()
        
        var serieData: Array<Float> = []
        var labels: Array<Float> = []
        var labelsAsString: Array<String> = []
        
        // Date formatter to retrieve the month names
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM"
        
        for (i, value) in stockValues.enumerate() {
            
            serieData.append(value["close"] as! Float)
            
            // Use only one label for each month
            let month = Int(dateFormatter.stringFromDate(value["date"] as! NSDate))!
            let monthAsString:String = dateFormatter.monthSymbols[month - 1] 
            if (labels.count == 0 || labelsAsString.last != monthAsString) {
                labels.append(Float(i))
                labelsAsString.append(monthAsString)
            }
        }
        
        let series = ChartSeries(serieData)
        series.area = true
        
        // Configure chart layout
        
        chart.lineWidth = 0.5
        chart.labelFont = UIFont(name: "HelveticaNeue-Light", size: 12)!
        chart.xLabels = labels
        chart.xLabelsFormatter = { (labelIndex: Int, labelValue: Float) -> String in
            return labelsAsString[labelIndex]
        }
        chart.xLabelsTextAlignment = .Center
        chart.yLabelsOnRightSide = true
        // Add some padding above the x-axis
        chart.minY = serieData.minElement()! - 5
        
        chart.addSeries(series)
        
    }
    // Chart delegate
    
    func didTouchChart(chart: Chart, indexes: Array<Int?>, x: Float, left: CGFloat) {
        
        if let value = chart.valueForSeries(0, atIndex: indexes[0]) {
            
            let numberFormatter = NSNumberFormatter()
            numberFormatter.minimumFractionDigits = 2
            numberFormatter.maximumFractionDigits = 2
            lblName.text = numberFormatter.stringFromNumber(value)!
            
            // Align the label to the touch left position, centered
//            var constant = labelLeadingMarginInitialConstant + left - (lblName.frame.width / 2)
            
            // Avoid placing the label on the left of the chart
//            if constant < labelLeadingMarginInitialConstant {
//                constant = labelLeadingMarginInitialConstant
//            }
            
            // Avoid placing the label on the right of the chart
            _ = chart.frame.width - lblName.frame.width
//            if constant > rightMargin {
//                constant = rightMargin
//            }
            
//            labelLeadingMarginConstraint.constant = constant
            
            
        }
        
    }
    
    func didFinishTouchingChart(chart: Chart) {
        lblName.text = ""
//        labelLeadingMarginConstraint.constant = labelLeadingMarginInitialConstant
    }
    
    
    func getStockValues() -> Array<Dictionary<String, Any>> {
        
        // Read the JSON file
        let filePath = NSBundle.mainBundle().pathForResource("AAPL", ofType: "json")!
        let jsonData = NSData(contentsOfFile: filePath)
        let json: NSDictionary = (try! NSJSONSerialization.JSONObjectWithData(jsonData!, options: [])) as! NSDictionary
        let jsonValues = json["quotes"] as! Array<NSDictionary>
        
        // Parse data
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let values = jsonValues.map() { (value: NSDictionary) -> Dictionary<String, Any> in
            let date = dateFormatter.dateFromString(value["date"]! as! String)
            let close = (value["close"]! as! NSNumber).floatValue
            return ["date": date!, "close": close]
        }
        
        return values
        
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        // Redraw chart on rotation
        chart.setNeedsDisplay()
        
    }
}
