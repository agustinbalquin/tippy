//
//  SettingsViewController.swift
//  tippsy
//
//  Created by Agustin Balquin on 6/20/17.
//  Copyright © 2017 Agustin Balquin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var tipRate1: UITextField!
    @IBOutlet weak var tipRate2: UITextField!
    @IBOutlet weak var tipRate3: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        tipRate1.text! = String(100 * defaults.double(forKey: "Rate1"))
        tipRate2.text! = String(100 * defaults.double(forKey: "Rate2"))
        tipRate3.text! = String(100 * defaults.double(forKey: "Rate3"))
        
    }
    
    
    @IBAction func doneEditing(_ sender: UITextField) {
        let rate = Double(tipRate1.text!) ?? 0
        let defaults = UserDefaults.standard
        defaults.set(rate/100, forKey: "Rate1")
        defaults.synchronize()
    }
    
    @IBAction func doneEditing2(_ sender: UITextField) {
        let rate = Double(tipRate2.text!) ?? 0
        let defaults = UserDefaults.standard
        defaults.set(rate/100, forKey: "Rate2")
        defaults.synchronize()
    }
    
    
    @IBAction func doneEditing3(_ sender: UITextField) {
        let rate = Double(tipRate3.text!) ?? 0
        let defaults = UserDefaults.standard
        defaults.set(rate/100, forKey: "Rate3")
        defaults.synchronize()
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
