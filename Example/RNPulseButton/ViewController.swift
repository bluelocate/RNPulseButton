//
//  ViewController.swift
//  RNPulseButton
//
//  Created by bluelocate on 12/30/2017.
//  Copyright (c) 2017 bluelocate. All rights reserved.
//

import UIKit
import RNPulseButton

class ViewController: UIViewController {
    
    @IBOutlet var pulse1: RNPulseButton!
    @IBOutlet var red: UISlider!
    @IBOutlet var green: UISlider!
    @IBOutlet var blue: UISlider!
    
    var pulse2: RNPulseButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // If you want to see Programmatical initial example.
        // Please uncomment this block.
        /*
        pulse2 = RNPulseButton(frame: CGRect(x: self.view.frame.width / 2 - 50, y: self.view.frame.height / 2, width: 100, height: 100),
                               pulseRadius: 100,
                               pulseCount: 4,
                               pulseDuration: 3,
                               intervalTime: 0.4,
                               scaleFactor: 3,
                               repeatCount: 100,
                               pulseColor: UIColor.red,
                               normalImage: nil, selectedImage: nil)
        self.view.addSubview(pulse2)
        pulse2.start()
         */
        pulse1.start()
        
    }
    
    @IBAction func touchEvent(_ sender: RNPulseButton) {
        pulse1.stop()
        
        // Uncomment it if you using pulse2.
        /*
        pulse2.pulseColor = UIColor.green
        pulse2.normalImage = #imageLiteral(resourceName: "ic-success")
         */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func radius(_ sender: UISlider) {
        pulse1.pulseRadius = Double(sender.value)
    }
    
    @IBAction func count(_ sender: UISlider) {
        pulse1.pulseCount = Int(sender.value)
    }
    
    @IBAction func duration(_ sender: UISlider) {
        pulse1.pulseDuration = Double(sender.value)
    }
    
    @IBAction func interval(_ sender: UISlider) {
        pulse1.intervalTime = Double(sender.value)
    }
    
    @IBAction func scale(_ sender: UISlider) {
        pulse1.scaleFactor = CGFloat(sender.value)
    }
    
    @IBAction func `repeat`(_ sender: UISlider) {
        pulse1.repeatCount = Int(sender.value)
    }
    
    @IBAction func color(_ sender: UISlider) {
        pulse1.pulseColor = UIColor.init(red: CGFloat(red.value), green: CGFloat(green.value), blue: CGFloat(blue.value), alpha: 1)
    }
}

