//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Weijie Chen on 3/1/17.
//  Copyright © 2017 Weijie Chen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let defaulttipsegmentindex = defaults.integer(forKey: "default_tip_segment_index")
        self.defaultTipControl.selectedSegmentIndex = defaulttipsegmentindex
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultTipPerChange(_ sender: AnyObject) {
        updateDefaultTip()
    }

    func updateDefaultTip() {
        UserDefaults.standard.set(defaultTipControl.selectedSegmentIndex, forKey: "default_tip_segment_index")
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
