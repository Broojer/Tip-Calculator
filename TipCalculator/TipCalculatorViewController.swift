//
//  TipCalculatorViewController.swift
//  TipCalculator
//
//  Created by RJ Beeferman on 4/21/16.
//  Copyright © 2016 RJ Beeferman. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate
{

 //UI things
    
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var splitResultsLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var tipLabel: UILabel!
    
    
    var TipCalc = tipCalc(amountBeforeTax: 25.00, tipPercentage: 15, split1: 1, amountOwed1: 0)
    
    
override func viewDidLoad() {
        super.viewDidLoad()
    
 
        amountBeforeTaxTextField.delegate = self
        
        amountBeforeTaxTextField.text = String(format: "%.2f", arguments: [TipCalc.amountBeforeTax])
  
        tipPercentageLabel.text = String(format: "Tip %d%%:", arguments: [Int(TipCalc.tipPercentage)])
        numberOfPeopleLabel.text = String(format: "Split %d:", arguments: [Int(TipCalc.split)])
        
}
    
 //functions
    
    func calcTip() {
        
        TipCalc.tipPercentage = Int(tipPercentageSlider.value)
        TipCalc.amountBeforeTax = ((amountBeforeTaxTextField.text)! as NSString).floatValue
        TipCalc.calculateTip()
        updateUI()
        
    //}
    
    
    
// func calcSplit() {
        
        TipCalc.split = Int(numberOfPeopleSlider.value)
        TipCalc.totalAmount = ((numberOfPeopleLabel.text)! as NSString).floatValue
    
//TipCalc.calcSplit()
// updateUI2()
        
        
   }

 //updates
    
    func updateUI() {
      
        
        resultsLabel.text = String(format: "Total: $%0.2f", arguments: [TipCalc.totalAmount])
        tipLabel.text = String(format: "Tip: $%0.2f", arguments: [TipCalc.tipAmount])
        
//}
    
    
//func updateUI2() {
        
        
        splitResultsLabel.text = String(format: "Amount Due: $%0.2f", arguments: [TipCalc.amountOwed])
        
    }
    
    
// when you enter text in text field it calls two functions above
    
    @IBAction func amountBeforeTaxTextFieldChanged(sender: AnyObject) {
        
    // calcSplit()
        calcTip()

   
}
    
    
// dismiss keyboard
    
func returnTextField(textfield: UITextField) -> Bool {
        
  
        textfield.resignFirstResponder()
    
           
        
            calcTip()
            //calcSplit()
            
           
            
    return true
      
   
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    @IBAction func tipPercentageSliderEditingChanged(sender: AnyObject) {
   
        tipPercentageLabel.text! = String(format: "%02d%%", arguments: [Int(tipPercentageSlider.value)])
      
        calcTip()
        //calcSplit()
        
    }
    
    
    
    @IBAction func splitSliderEditingChanged(sender: AnyObject) {
        numberOfPeopleLabel.text! = String(format: "Split: %0d%", arguments:[Int(numberOfPeopleSlider.value)])
       
       // calcSplit()
        calcTip()
    
    }
    


    

    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()


    }
    
    
    
    
    
}