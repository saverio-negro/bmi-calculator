//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Saverio Negro on 27/06/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

// The "Foundation" module allows you to work with most of the features
// of the Swift programming language.
// import Foundation

// The "UIKit" module allows you to work specifically with the
// User Interface Components in iOS.

// Since UIKit is a super set of the "Foundation" framework, it already
// has all the capabilities (properties and methods) coming from it.

import UIKit

class SecondViewController: UIViewController {
    
    var bmiValue: String = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let label = UILabel()
        label.text = "BMI: \(self.bmiValue)"
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        view.addSubview(label)
    }
}
