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

    
    var tipPercentages = [0.15,0.2,0.25]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        tipPercentages[0] = defaults.double(forKey: "Rate1")
        tipPercentages[1] = defaults.double(forKey: "Rate2")
        tipPercentages[2] = defaults.double(forKey: "Rate3")
        
        var count = 0
        for rate in tipPercentages{
            tipControl.setTitle(String(rate), forSegmentAt: count)
            count += 1
        }
        calculateTip(textField)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setControl()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setControl()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setControl () {
        let defaults = UserDefaults.standard
        defaults.set(tipPercentages[0], forKey: "Rate1")
        defaults.set(tipPercentages[1], forKey: "Rate2")
        defaults.set(tipPercentages[2], forKey: "Rate3")
        defaults.synchronize()
    }



    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
            view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: UITextField) {
        
        
        let bill = Double(textField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f" , tip)
        totalLabel.text = String(format: "$%.2f" , total)
        
        
    }
    
    @IBAction func changeTip(_ sender: UISegmentedControl) {
        calculateTip(textField)
    }
    

}

