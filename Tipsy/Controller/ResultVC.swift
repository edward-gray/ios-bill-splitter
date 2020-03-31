//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Edward Gray on 31.03.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    var result = "0.0"
    var tip = "10"
    var splitBetween = 2
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = result
        descriptionLabel.text = "Split between \(splitBetween) people, with \(tip)% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
