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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        
        var selectedTipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
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

