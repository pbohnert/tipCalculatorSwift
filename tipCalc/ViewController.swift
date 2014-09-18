//
//  ViewController.swift
//  tipCalc
//
//  Created by Peter Bohnert on 9/17/14.
//  Copyright (c) 2014 Blue Lotus Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00";
        totalLabel.text = "$0.00";
        
        // get last saved value - store 18 if empty

        var defaults = NSUserDefaults.standardUserDefaults()
 
        var tempDefaults = defaults.objectForKey("origTipPercentageAmount") as String
        if tempDefaults.isEmpty {
            defaults.setObject("18", forKey: "origTipPercentageAmount")
        }
        
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        
        var selectedTipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        // store new persistent value
        var tipAsPercent = selectedTipPercentage * 100
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("\(tipAsPercent)", forKey: "origTipPercentageAmount")
        defaults.synchronize()
        
       // var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tipAmount = billAmount * selectedTipPercentage
        var totalAmount = billAmount + tipAmount
       
        // What we'd prefer to be writing below, if Swift would
        //    support 2 decimal points "out of the box"
        // tipLabel.text = "$\(tipAmount)"
        // totalLabel.text = "$\(totalAmount)"
        
        // what we instead have to do for now...
        tipLabel.text = String(format: "$%.2f", tipAmount)
        totalLabel.text = String(format: "$%.2f", totalAmount)
    
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }
}

