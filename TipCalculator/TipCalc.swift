//
//  TipCalc.swift
//  TipCalculator
//
//  Created by RJ Beeferman on 4/21/16.
//  Copyright © 2016 RJ Beeferman. All rights reserved.
//

import Foundation

class tipCalc
{
    
// variables
    
    
    var tipAmount: Float = 0
    var amountBeforeTax: Float = 0
    var tipPercentage: Int = 0
    var totalAmount: Float = 0
    var split: Int = 1
    var amountOwed: Float = 0
    

// initilizer
    
    init(amountBeforeTax: Float, tipPercentage: Int, split1: Int, amountOwed1: Float) {
        
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
        self.split = split1
       self.amountOwed = amountOwed1
    }

// function that calculates all values
    
    func calculateTip() {
   
        tipAmount = ((Float(amountBeforeTax)) * (Float(tipPercentage) / 100))
        totalAmount = tipAmount + (Float(amountBeforeTax))
        amountOwed = (totalAmount / (Float(split)))
        
    }
}