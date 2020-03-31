//
//  CalculateVC.swift
//  Tipsy
//
//  Created by Edward Gray on 31.03.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class CalculateVC: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    
    var totalAmount: Double = 0.0
    var tip = 0.10
    var tipForScreen = "10"
    var splitNumber = 2
    
    var calculateBrain: CalculateBrain? = nil
    
    @IBAction func percentagePressed(_ sender: UIButton) {
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        sender.isSelected = true
        
        if sender.tag == 0 {
            tip = 0
            tipForScreen = "0"
        } else if sender.tag == 20 {
            tip = 0.2
            tipForScreen = "20"
        } else {
            tip = 0.1
            tipForScreen = "10"
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func billEntered(_ sender: UITextField) {
        if sender.text != "" {
            totalAmount = Double(sender.text!) ?? 0
        }
    }

    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(splitNumber)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
//        print("totalAmount: \(totalAmount), tip: \(tip), splitBetween: \(splitNumber)")
        calculateBrain = CalculateBrain(totalAmount: totalAmount, tip: tip, splitBetween: splitNumber)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        billTextField.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultVC
            resultVC.result = String(format: "%.2f", calculateBrain!.getResult())
            resultVC.splitBetween = splitNumber
            resultVC.tip = tipForScreen
        }
    }

}
