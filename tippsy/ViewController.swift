//
//  ViewController.swift
//  tippsy
//
//  Created by Agustin Balquin on 6/20/17.
//  Copyright © 2017 Agustin Balquin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
            view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: UITextField) {
        
        let tipPercentages = [0.15,0.2,0.25]
        let bill = Double(textField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%f" , tip)
        totalLabel.text = String(format: "$%f" , total)
        
        
        
    }
    

}

