//
//  ViewController.swift
//  Tippy
//
//  Created by Ritik Raina on 8/23/19.
//  Copyright © 2019 Ritik Raina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var onePersonLabel: UILabel!
    @IBOutlet weak var twoPersonLabel: UILabel!
    @IBOutlet weak var threePersonLabel: UILabel!
    @IBOutlet weak var fourPersonLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let locale = Locale.current
        let currencyCode = locale.currencySymbol!
        self.billField.placeholder = currencyCode
        billField.becomeFirstResponder()
        calculateTip(1)
        let defaults = UserDefaults.standard
        let tipIndex = defaults.integer(forKey: "initialValue")
        tipControl.selectedSegmentIndex = tipIndex
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.10, 0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let onePerson = bill + tip
        let twoPerson = (bill + tip)/2
        let threePerson = (bill + tip)/3
        let fourPerson = (bill + tip)/4
        
        tipLabel.text = NumberFormatter.localizedString(from: NSNumber(value: tip), number: .currency)
        onePersonLabel.text = NumberFormatter.localizedString(from: NSNumber(value: onePerson), number: .currency)
        twoPersonLabel.text = NumberFormatter.localizedString(from: NSNumber(value: twoPerson), number: .currency)
        threePersonLabel.text = NumberFormatter.localizedString(from: NSNumber(value: threePerson), number: .currency)
        fourPersonLabel.text = NumberFormatter.localizedString(from: NSNumber(value: fourPerson), number: .currency)
    }
    
}

