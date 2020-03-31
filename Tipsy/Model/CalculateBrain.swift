//
//  CalculateBrain.swift
//  Tipsy
//
//  Created by Edward Gray on 31.03.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculateBrain {
    var totalAmount: Double
    var tip: Double
    var splitBetween: Int
    
    func getResult() -> Double {
        return (totalAmount * (1 + tip)) / Double(splitBetween)
    }
    
}
