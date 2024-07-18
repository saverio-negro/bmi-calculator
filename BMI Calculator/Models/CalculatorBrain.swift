//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Saverio Negro on 25/06/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    private var bmi: BMI?
    
    mutating func getBMIValue() -> String {
        return String(format: "%.1f", self.bmi?.value ?? 0.0)
    }
    
    mutating func getAdvice() -> String {
        return self.bmi?.advice ?? "Please, enter your height and weight!"
    }
    
    mutating func getColor() -> UIColor {
        return self.bmi?.color ?? UIColor.white
    }
    
    mutating func interpretBMI(_ bmiValue: Float) -> BMI {
        
        if bmiValue > 39 {
            return BMI(value: bmiValue, advice: "Please, consider starting a wealthier diet!", color: UIColor.red)
        } else if bmiValue > 29.9 {
            return BMI(value: bmiValue, advice: "Eat far less pies!", color: UIColor.orange)
        } else if bmiValue > 24.9 {
            return BMI(value: bmiValue, advice: "Eat less pies!", color: UIColor.yellow)
        } else if bmiValue > 18.5 {
            return BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
        } else {
            return BMI(value: bmiValue, advice: "Eat more pies!", color: UIColor.systemIndigo)
        }
    }
    
    mutating public func calculateBMI(height: Float, weight: Float) -> Void {
        let bmiValue = weight / pow(height, 2)
        bmi = interpretBMI(bmiValue)
    }
}
