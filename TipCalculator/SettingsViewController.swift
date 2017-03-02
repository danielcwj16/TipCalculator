//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Weijie Chen on 3/1/17.
//  Copyright © 2017 Weijie Chen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        defaults.set("some_string_to_save", forKey: "some_key_that_you_choose")
        defaults.set(123, forKey: "another_key_you_choose")
        defaults.synchronize()

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
