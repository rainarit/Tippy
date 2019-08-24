//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Ritik Raina on 8/23/19.
//  Copyright © 2019 Ritik Raina. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTip.selectedSegmentIndex, forKey: "initialValue")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let index = defaults.integer(forKey: "initialValue")
        defaultTip.selectedSegmentIndex = index
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
