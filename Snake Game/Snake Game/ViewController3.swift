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
        snake = SnakeLocation()
        appleNumDisplay.text = "\(NSUserDefaults.standardUserDefaults().integerForKey("appleNum"))"
    }
}