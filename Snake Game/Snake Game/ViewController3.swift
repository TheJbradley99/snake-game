//
//  ViewController3.swift
//  Snake Game
//
//  Created by Josh on 12/10/15.
//  Copyright © 2015 Josh Bradley. All rights reserved.
//

import Foundation
import UIKit

class ViewController3: UIViewController, UITextFieldDelegate {
    
    var snake: SnakeLocation!
    @IBOutlet weak var appleSliderNum: UISlider!
    
    @IBOutlet weak var appleNumDisplay: UILabel!
    
    @IBAction func sliderValueChanged(sender: UISlider) {
        NSUserDefaults.standardUserDefaults().setInteger(Int(sender.value), forKey: "appleNum")
        NSUserDefaults.standardUserDefaults().synchronize()
        appleNumDisplay.text = "\(NSUserDefaults.standardUserDefaults().integerForKey("appleNum"))"
    }
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunch")
        if firstLaunch  {
            //print("Not first launch.")
        }
        else {
            //print("First launch, setting NSUserDefault.")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")
            NSUserDefaults.standardUserDefaults().setInteger(Int(appleSliderNum.value), forKey: "appleNum")
        }
        //NSUserDefaults.standardUserDefaults().setInteger(Int(appleSliderNum.value), forKey: "appleNum")
        snake = SnakeLocation()
        appleNumDisplay.text = "\(NSUserDefaults.standardUserDefaults().integerForKey("appleNum"))"
        appleSliderNum.value = Float(NSUserDefaults.standardUserDefaults().integerForKey("appleNum"))
    }
}