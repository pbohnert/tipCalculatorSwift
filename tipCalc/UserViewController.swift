//
//  UserViewController.swift
//  tipCalc
//
//  Created by Peter Bohnert on 9/18/14.
//  Copyright (c) 2014 Blue Lotus Labs. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var tipDefaultField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // retrieve our stored default tip percentage
        var defaults = NSUserDefaults.standardUserDefaults()        
        tipDefaultField.text = defaults.objectForKey("origTipPercentageAmount") as String
      

        // Do any additional setup after loading the view.
    }
    
    @IBAction func chgTipPercentage(sender: AnyObject) {
    }
    
    @IBAction func doneClicked(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
       //
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        // save default tip to NSUserDefaults
        var defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(tipDefaultField.text, forKey: "origTipPercentageAmount")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
