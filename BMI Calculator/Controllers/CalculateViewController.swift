//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text  = "\(weight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        // Look up notes on "performSegue" and "prepare" down below
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Checks for which segue gets passed to "prepare" from "performSegue"
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultViewController
            destination.bmiValue = calculatorBrain.getBMIValue()
            destination.advice = calculatorBrain.getAdvice()
            destination.color = calculatorBrain.getColor()
        }
    }
}

// Notes:

// Instantiate the "SecondViewController" class and present it
// let resultView = SecondViewController()
// resultView.bmiValue = String(format: "%.1f", bmi)
// self.present(resultView, animated: true, completion: nil)

// The "performSegue" method executes a "prepare" method,
// in order to notify the view controller that a segue is about to
// be performed, in order to carry out various operations before
// the segue is performed. In order words, if you wanted to perform
// some operations just before the segue gets initiated, you would
// have to override that "prepare" method being called by the
// "performSegue" method and add on your custom code.
// For instance, you might want to grab hold of the destination
// view controller by accessing the segue parameter (segue.destination).

// In addition, the "performSegue" method is also responsible for
// eventually initializing our "ResultViewController" and presenting
// it. In fact, when the segue object gets instantiated from the
// "UIStoryboardSegue" class, one of the arguments that the initializer
// gets passed is going to be the instance of the view controller class,
// (ResultViewController, in our case), and it gets assigned to the
// "destination" property.

// That obviously depends on how the segue is set in the Main.storyboard file.
// In fact, depending on the segue's identifier (segue.identifier), we are
// going to have a specific view controller object as the value to the
// destination property.

// Therefore, in a multi-screen app, because we might have the same view
// controller class segue to more than one view controller - more
// than one segue, each with a different identifier - we should check for
// which segue object gets passed to the "prepare" function when it gets
// called by the "performSegue" method; otherwise, we would perform the
// same operations for every segue.
