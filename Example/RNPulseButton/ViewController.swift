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

    var pulse2: RNPulseButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        pulse2 = RNPulseButton(frame: CGRect(x: 150, y: 300, width: 100, height: 100),
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
        pulse1.start()
        
    }
    
    @IBAction func touchEvent(_ sender: RNPulseButton) {
        pulse1.stop()
        pulse2.backgroundColor = UIColor.red
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

